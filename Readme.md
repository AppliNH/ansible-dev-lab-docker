# Ansible dev lab with Docker

To start :

`docker-compose up --build`

Then, inside master container :

- `ssh-agent bash`
- `ssh-add /var/ansible_keys/master_key`


Check that everything is setup correctly with :

`ansible -m ping all`


## Config ansible_workspace

To target a local dir containing your ansible playbook workspace, simply use an .env containing : 

```
ANSIBLE_LAB_WORKSPACE=/absolute/path/to/your/workspace
```

**Be sure that you're using an absolute path**

You can switch between your env file when starting the lab with the `--env-file` argument of the docker-compose CLI, like so :

`docker-compose --env-file ./.env.dev up`

To make sure that your env file has been loaded correctly, check the compose file that is about to be used to start the lab :

`docker-compose --env-file ./.env.dev config`


^ There you should see your workspace path appear in the outputted YML config.