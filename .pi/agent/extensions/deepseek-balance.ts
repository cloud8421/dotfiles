/**
 * DeepSeek Balance Extension
 *
 * Registers a /balance command that fetches and displays
 * DeepSeek API account balance from api.deepseek.com.
 *
 * Usage: type /balance in pi
 *
 * The API key is resolved from:
 *   1. DEEPSEEK_API_KEY environment variable
 *   2. ~/.pi/agent/auth.json (deepseek entry)
 */

import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";
import * as fs from "node:fs";
import * as path from "node:path";
import * as os from "node:os";

// ---------------------------------------------------------------------------
// API key resolution
// ---------------------------------------------------------------------------

function getApiKey(): string | null {
  // 1. Environment variable
  const envKey = process.env.DEEPSEEK_API_KEY;
  if (envKey) return envKey;

  // 2. pi auth.json
  try {
    const authPath = path.join(os.homedir(), ".pi", "agent", "auth.json");
    const raw = fs.readFileSync(authPath, "utf-8");
    const auth = JSON.parse(raw);
    if (auth.deepseek?.key && typeof auth.deepseek.key === "string") {
      return auth.deepseek.key;
    }
  } catch {
    // auth.json missing or malformed — skip
  }

  return null;
}

// ---------------------------------------------------------------------------
// Balance types
// ---------------------------------------------------------------------------

interface BalanceInfo {
  currency: string;
  total_balance: string;
  topped_up_balance: string;
  granted_balance: string;
}

interface BalanceResponse {
  is_available: boolean;
  balance_infos?: BalanceInfo[];
}

// ---------------------------------------------------------------------------
// Formatting
// ---------------------------------------------------------------------------

function formatBalance(data: BalanceResponse): string {
  const infos = data.balance_infos ?? [];

  if (infos.length === 0) {
    return `DeepSeek API is ${data.is_available ? "available" : "unavailable"} — no balance info returned.`;
  }

  const lines = infos.map((b) => {
    const parts: string[] = [];
    parts.push(`${b.currency} ${b.total_balance}`);
    if (b.topped_up_balance !== b.total_balance) {
      parts.push(
        `(topped up: ${b.topped_up_balance}, granted: ${b.granted_balance})`,
      );
    }
    return parts.join(" ");
  });

  const status = data.is_available ? "✓ available" : "✗ unavailable";
  return `DeepSeek Balance [${status}]\n${lines.join("\n")}`;
}

// ---------------------------------------------------------------------------
// Extension
// ---------------------------------------------------------------------------

export default function deepseekBalanceExtension(pi: ExtensionAPI) {
  pi.registerCommand("balance", {
    description: "Check DeepSeek API account balance",

    handler: async (_args, ctx) => {
      const apiKey = getApiKey();

      if (!apiKey) {
        ctx.ui.notify(
          "No DeepSeek API key found.\nSet DEEPSEEK_API_KEY or store it via /login → DeepSeek.",
          "error",
        );
        return;
      }

      // Mask key for display
      const masked =
        apiKey.length > 7
          ? `${apiKey.slice(0, 4)}...${apiKey.slice(-4)}`
          : "****";

      ctx.ui.notify(`Fetching balance (key: ${masked})…`, "info");

      try {
        const response = await fetch("https://api.deepseek.com/user/balance", {
          headers: { Authorization: `Bearer ${apiKey}` },
        });

        if (!response.ok) {
          const body = await response.text().catch(() => "");
          ctx.ui.notify(
            `DeepSeek API returned ${response.status} ${response.statusText}\n${body.slice(0, 200)}`,
            "error",
          );
          return;
        }

        const data: BalanceResponse = await response.json();
        const message = formatBalance(data);
        ctx.ui.notify(message, "info");
      } catch (err: any) {
        ctx.ui.notify(
          `Failed to fetch balance: ${err?.message ?? String(err)}`,
          "error",
        );
      }
    },
  });
}
