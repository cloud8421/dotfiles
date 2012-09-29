function __cache_or_get_ag_completion -d "Create ag completions"
  cut -f 1 .tags | uniq | grep -v '!_'
end

complete -x -c ag -a "(__cache_or_get_ag_completion)" --description 'Ctag'
