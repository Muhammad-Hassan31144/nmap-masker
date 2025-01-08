# Nmap_Masker

The **Advanced Nmap Scanning Utility** is designed to simplify the use of Nmap by offering an interactive Bash interface. Instead of memorizing complex commands, users can navigate through easy-to-use menus that guide them through various scanning options and configurations.

## Why Use This Script?

- **No More Command Overload:** Avoid the hassle of remembering Nmap's extensive list of options.
- **Simplified Workflow:** Navigate through an interactive menu to configure scans step by step.
- **Comprehensive Features:** Access all major Nmap functionalities, from host discovery to firewall evasion, in one place.
- **Efficient Scanning:** Quickly set up scans with error handling to guide your inputs.

## Features

- **Target Specification:** Define hostnames, IP ranges, or networks.
- **Host Discovery:** Multiple techniques to discover live hosts.
- **Scan Techniques:** TCP SYN, UDP, and other scan methods.
- **Port Specifications:** Customize ports to scan or exclude.
- **Service/Version Detection:** Probe open ports for service and version info.
- **OS Detection:** Identify operating systems with optional aggressive guessing.
- **Timing and Performance:** Adjust scan speed, retries, and delays.
- **Firewall/IDS Evasion:** Cloak scans with decoys, spoof MAC, and more.
- **Output Management:** Save scans in multiple formats.
- **Miscellaneous Options:** IPv6 scanning, traceroute, and more.
## Clone
1. Clone this repository to your local system:
```bash
git clone <repository_url> cd <repository_name>
```

2. Make the script executable:

 ```bash
 chmod +x nmap_script.sh
 ```
 
3. Run the script:
```bash
./nmap_script.sh
```
4. Follow the interactive menu to choose your scan options.
## Example Workflow

1. Select your scan category (e.g., **Target Specification**).
2. Enter details such as IP address or hostname.
3. Choose specific options for each scan category.
4. Specify output preferences (e.g., Normal, XML, or Grepable format).
5. Review your options and execute the scan.

## Usage/Examples


Here’s a quick example of how the script simplifies scanning:

Without the Script:
```bash
nmap -sS -p 22,80 -O --top-ports 100 --exclude 192.168.1.1 -oN output.txt
```

With the Script:
```bash
Navigate the menus to select:

Scan Technique: TCP SYN Scan

Ports: 22, 80

OS Detection: Enabled

Top Ports: 100

Excluded Hosts: 192.168.1.1

Output Format: Normal
```

The script automatically constructs and runs the equivalent command!

## 🔗 Links
[![portfolio](https://img.shields.io/badge/my_portfolio-000?style=for-the-badge&logo=ko-fi&logoColor=white)](https://muhammad-hassan31144.github.io/web-dev/)
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/muhammad-hassan31144/)


## Disclaimer
This script is intended for ethical use only. Always obtain proper authorization before scanning any network or device.
## License
License

This project is licensed under the MIT License. See the LICENSE file for details
[MIT](https://choosealicense.com/licenses/mit/)

