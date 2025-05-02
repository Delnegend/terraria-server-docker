# Terraria Server Container

## Prerequisites
- [Docker Engine](https://docs.docker.com/engine/) or [Podman](https://podman.io/) (duh)

## Guide
1. Clone/download this repository
2. Create a new world in Terraria.
3. Copy the world files into `data/Worlds/`.
4. Rename `serverconfig.txt.example` to `serverconfig.txt` and modify the `world` parameter to match the name of your world file (e.g., `world=/home/terraria/.local/share/Terraria/Worlds/YourWorldName.wld`).
5. Start the server using `docker compose up -d` or `podman-compose up -d`.

## References
- [Guide:Setting up a Terraria server](https://terraria.fandom.com/wiki/Guide:Setting_up_a_Terraria_server)