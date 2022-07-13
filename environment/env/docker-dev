############################### DOCKER DEV STUFF ##############################

alias docker-kill="docker ps --format '{{.Image}} {{.Names}}' | fzf -m --preview 'docker ps | grep {2}' | cut -d ' ' -f 2 | xargs -I '{}' -r docker kill '{}'"
alias docker-exec='docker exec -it $(docker ps --format "{{.Image}} {{.Names}}" | fzf --preview="docker ps | grep {2}"   | cut -d " " -f 2) bash'
alias docker-rmi='docker images --format "{{.Repository}} {{.Tag}} {{.ID}}" | fzf -m --preview "docker images --format \"{{.ID}} {{.CreatedAt}}\" | grep {3}" | cut -d " " -f 3 | xargs -I "{}" -r docker rmi "{}"'
alias docker-rmif='docker images --format "{{.Repository}} {{.Tag}} {{.ID}}" | fzf -m --preview "docker images --format \"{{.ID}} {{.CreatedAt}}\" | grep {3}" | cut -d " " -f 3 | xargs -I "{}" -r docker rmi "{}" --force'
alias docker-dev='docker-compose -f docker-compose-dev.yml up -d'
