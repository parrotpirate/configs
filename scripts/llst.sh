#!/usr/bin/env bash
{
  LOCALDEV="/Users/stevep/localdev"
  readonly ENV="$LOCALDEV/.env"

  case $1 in

  create | new)
    (
      cd $LOCALDEV || exit
      docker compose up --build -d
      sleep 1
      docker compose exec php bash q4-init.sh
      sleep 1
      docker compose exec php bash q4-database.sh
      open http://localhost:9090/
    )
    ;;

  up | start | resume)
    (
      cd $LOCALDEV || exit
      docker compose up -d
      open http://localhost:9090/
    )
    ;;

  pause | stop)
    (
      cd $LOCALDEV || exit
      docker compose stop
    )
    ;;

  down | remove | delete | kill)
    (
      cd $LOCALDEV || exit
      docker compose up -d
      sleep 1
      docker compose exec php wp db export seed.sql --allow-root
      sleep 1
      docker compose down
    )
    ;;

  switch | swap)
    # read "NEWMONIKER?New moniker: "
    echo New moniker:
    read NEWMONIKER
    (
      cd $LOCALDEV || exit
      docker compose stop
      if [[ -f .env ]]; then
        source .env
        mv .env ."$MONIKER"
        if [[ -f ."$NEWMONIKER" ]]; then
          mv ."$NEWMONIKER" .env
          docker compose up -d
          open http://localhost:9090/
        else
          cp .env.example .env
          nvim .env
        fi
      else
        cp .env.example .env
        nvim .env
      fi
    )
    ;;

  current)
    (
      cd $LOCALDEV || exit
      if [[ -f .env ]]; then
        source .env
        echo "$MONIKER"
      fi
    )
    ;;

  list)
    (
      cd $LOCALDEV || exit
      ls -Af \.[^'git'][^'env'][^'dock']*
    )
    ;;

  setup)
    if [[ ! -f wp-config.php ]]; then
      FOLDER=s/MONIKER=.*/MONIKER=${PWD##*/}/
      DIR=s%WEB_ROOT=.*%WEB_ROOT=${PWD}%
      cp $LOCALDEV/wordpress/wp-config.php .
      # mv /Users/stevep/Downloads/seed.sql .
      (
        cd $LOCALDEV || exit
        if [[ -f .env ]]; then
          source .env
          mv .env ."$MONIKER"
        fi
        cp .env.example .env
        sed -i '' "$FOLDER" ./.env
        sed -i '' "$DIR" ./.env
        nvim .env
      )
    fi
    ;;

  browse | cd)
    if [[ -f "$LOCALDEV"/.env ]]; then
      source $ENV
      cd "$WEB_ROOT" || exit
      $SHELL
    else
      print "No local site currently active."
    fi
    ;;

  open)
    open http://localhost:9090/
    ;;

  dev)
    cd $LOCALDEV || exit
    docker compose up -d
    open http://localhost:9090/
    if [[ -f "$LOCALDEV"/.env ]]; then
      source $ENV
      cd "$WEB_ROOT" || exit
      $SHELL
    else
      print "No local site currently active."
    fi
    ;;

  help)
    printf "Available Commands:\n---\ncreate\nnew\n---\nup\nstart\nresume\n---\npause\nstop\n---\ndown\nremove\ndelete\nkill\n---\nswitch\nswap\n---\ncurrent\n---\nsetup\n---\nbrowse\ncd\n---\nopen\n--\ndev\n"
    ;;

  esac
}
