### Run docker as private IP
docker run -d --name container_name --dns=server_private_ip -v /path/to/resolv.conf:/etc/resolv.conf --add-host=host_name:server_private_ip -p port image_tag_name
