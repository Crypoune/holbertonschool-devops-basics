# Exploring Your First Network

This project introduces basic Linux networking concepts through practical Bash scripts.

The goal is to inspect the current network environment using standard Linux networking utilities and understand how interfaces, addresses, routes, hostname resolution, neighbor information, and listening sockets work together.

## Learning Objectives

- Identify network interfaces and their operational state.
- Inspect IPv4, IPv6, and link-layer addresses.
- Understand the IPv4 loopback interface and ICMP reachability tests.
- Identify configured IPv4 default routes.
- Understand system hostname resolution and the Name Service Switch.
- Inspect the IPv4 neighbor table.
- Identify listening TCP sockets.
- Understand the relationship between routing, neighbor discovery, and network interfaces.

## Tasks

| Task | Description                                           | File                    |
| ---- | ----------------------------------------------------- | ----------------------- |
| 0    | List network interfaces and their assigned addresses  | `list_interfaces.sh`    |
| 1    | Display link-layer information for network interfaces | `show_links.sh`         |
| 2    | Discover and test the IPv4 loopback address           | `test_loopback.sh`      |
| 3    | Display configured IPv4 default routes                | `show_default_route.sh` |
| 4    | Resolve a hostname using the system host database     | `resolve_hostname.sh`   |
| 5    | Display the current IPv4 neighbor table               | `show_neighbors.sh`     |
| 6    | List currently listening TCP sockets                  | `list_listening_tcp.sh` |
| 7    | Complete the networking readiness quiz                | —                       |

## Networking Tools

The project uses standard Linux networking utilities:

- `ip` — inspect interfaces, addresses, routes, and neighbors.
- `ping` — perform ICMP echo tests.
- `getent` — query system-configured databases and hostname resolution.
- `ss` — inspect network sockets.

## Requirements

- Linux environment
- Bash
- Standard Linux networking utilities
- No root privileges required
- No external packages or libraries

The scripts inspect the current environment dynamically and do not hardcode network-specific values such as interface names, IP addresses, MAC addresses, gateways, or ports.

## Usage

Make the scripts executable:

```bash
chmod +x *.sh
```

Then run the desired script:

```bash
./list_interfaces.sh
```

The hostname resolution script accepts one hostname as its first argument:

```bash
./resolve_hostname.sh localhost
```

## Project Structure

```text
exploring_your_first_network/
├── list_interfaces.sh
├── show_links.sh
├── test_loopback.sh
├── show_default_route.sh
├── resolve_hostname.sh
├── show_neighbors.sh
├── list_listening_tcp.sh
└── README.md
```
