#!/bin/bash

# Function to handle invalid input
invalid_input() {
    echo "Invalid input. Please try again."
    sleep 1
}

# Function to return to the main menu
return_to_menu() {
    echo "Returning to the main menu..."
    sleep 1
}

# Ensure Nmap is installed
check_nmap_installed() {
    if ! command -v nmap &> /dev/null; then
        echo "Nmap is not installed. Please install it and rerun the script."
        exit 1
    fi
}

# Scan Techniques Menu
scan_techniques() {
    while true; do
        clear
        echo "Scan Techniques Menu:"
        echo "1. TCP SYN Scan (-sS)"
        echo "2. TCP Connect Scan (-sT)"
        echo "3. TCP ACK Scan (-sA)"
        echo "4. TCP Window Scan (-sW)"
        echo "5. TCP Maimon Scan (-sM)"
        echo "6. UDP Scan (-sU)"
        echo "7. TCP Null Scan (-sN)"
        echo "8. TCP FIN Scan (-sF)"
        echo "9. TCP Xmas Scan (-sX)"
        echo "10. Customize TCP Scan Flags (--scanflags)"
        echo "11. Idle Scan (-sI)"
        echo "12. SCTP INIT Scan (-sY)"
        echo "13. SCTP COOKIE-ECHO Scan (-sZ)"
        echo "14. IP Protocol Scan (-sO)"
        echo "15. FTP Bounce Scan (-b)"
        echo "16. Go back to Main Menu"
        read -p "Select an option: " choice

        case $choice in
        1)
            read -p "Enter target (IP address, hostname, or network): " target
            echo "Executing: nmap -sS $target"
            nmap -sS "$target"
            ;;
        2)
            read -p "Enter target (IP address, hostname, or network): " target
            echo "Executing: nmap -sT $target"
            nmap -sT "$target"
            ;;
        3)
            read -p "Enter target (IP address, hostname, or network): " target
            echo "Executing: nmap -sA $target"
            nmap -sA "$target"
            ;;
        4)
            read -p "Enter target (IP address, hostname, or network): " target
            echo "Executing: nmap -sW $target"
            nmap -sW "$target"
            ;;
        5)
            read -p "Enter target (IP address, hostname, or network): " target
            echo "Executing: nmap -sM $target"
            nmap -sM "$target"
            ;;
        6)
            read -p "Enter target (IP address, hostname, or network): " target
            echo "Executing: nmap -sU $target"
            nmap -sU "$target"
            ;;
        7)
            read -p "Enter target (IP address, hostname, or network): " target
            echo "Executing: nmap -sN $target"
            nmap -sN "$target"
            ;;
        8)
            read -p "Enter target (IP address, hostname, or network): " target
            echo "Executing: nmap -sF $target"
            nmap -sF "$target"
            ;;
        9)
            read -p "Enter target (IP address, hostname, or network): " target
            echo "Executing: nmap -sX $target"
            nmap -sX "$target"
            ;;
        10)
            read -p "Enter target (IP address, hostname, or network): " target
            read -p "Enter custom TCP flags (e.g., SYN, ACK): " flags
            echo "Executing: nmap --scanflags $flags $target"
            nmap --scanflags "$flags" "$target"
            ;;
        11)
            read -p "Enter zombie host (format: host[:probeport]): " zombie
            read -p "Enter target (IP address, hostname, or network): " target
            echo "Executing: nmap -sI $zombie $target"
            nmap -sI "$zombie" "$target"
            ;;
        12)
            read -p "Enter target (IP address, hostname, or network): " target
            echo "Executing: nmap -sY $target"
            nmap -sY "$target"
            ;;
        13)
            read -p "Enter target (IP address, hostname, or network): " target
            echo "Executing: nmap -sZ $target"
            nmap -sZ "$target"
            ;;
        14)
            read -p "Enter target (IP address, hostname, or network): " target
            echo "Executing: nmap -sO $target"
            nmap -sO "$target"
            ;;
        15)
            read -p "Enter FTP relay host: " ftp_host
            read -p "Enter target (IP address, hostname, or network): " target
            echo "Executing: nmap -b $ftp_host $target"
            nmap -b "$ftp_host" "$target"
            ;;
        16)
            return_to_menu
            break
            ;;
        *)
            invalid_input
            ;;
        esac
        read -p "Press Enter to continue..."
    done
}

# Target Specification Menu
target_specification() {
    while true; do
        clear
        echo "Target Specification Menu:"
        echo "1. Input from list of hosts/networks (-iL)"
        echo "2. Choose random targets (-iR)"
        echo "3. Exclude hosts/networks (--exclude)"
        echo "4. Exclude list from file (--excludefile)"
        echo "5. Go back to Main Menu"
        read -p "Select an option: " choice

        case $choice in
        1)
            read -p "Enter filename containing target hosts/networks: " filename
            if [[ -f "$filename" ]]; then
                echo "Executing: nmap -iL $filename"
                nmap -iL "$filename"
            else
                echo "File not found! Please check the filename."
            fi
            ;;
        2)
            read -p "Enter the number of random hosts to scan: " num_hosts
            if [[ "$num_hosts" =~ ^[0-9]+$ ]]; then
                echo "Executing: nmap -iR $num_hosts"
                nmap -iR "$num_hosts"
            else
                invalid_input
            fi
            ;;
        3)
            read -p "Enter hosts/networks to exclude (comma-separated): " exclude_list
            echo "Executing: nmap --exclude $exclude_list"
            nmap --exclude "$exclude_list"
            ;;
        4)
            read -p "Enter filename containing exclude list: " exclude_file
            if [[ -f "$exclude_file" ]]; then
                echo "Executing: nmap --excludefile $exclude_file"
                nmap --excludefile "$exclude_file"
            else
                echo "File not found! Please check the filename."
            fi
            ;;
        5)
            return_to_menu
            break
            ;;
        *)
            invalid_input
            ;;
        esac
        read -p "Press Enter to continue..."
    done
}

# Host Discovery Menu
host_discovery() {
    while true; do
        clear
        echo "Host Discovery Menu:"
        echo "1. List Scan (-sL)"
        echo "2. Ping Scan (-sn)"
        echo "3. Treat all hosts as online (-Pn)"
        echo "4. TCP SYN/ACK, UDP, or SCTP discovery to given ports (-PS/PA/PU/PY)"
        echo "5. ICMP echo, timestamp, and netmask request probes (-PE/PP/PM)"
        echo "6. Go back to Main Menu"
        read -p "Select an option: " choice

        case $choice in
        1)
            read -p "Enter target (IP address, hostname, or network): " target
            echo "Executing: nmap -sL $target"
            nmap -sL "$target"
            ;;
        2)
            read -p "Enter target (IP address, hostname, or network): " target
            echo "Executing: nmap -sn $target"
            nmap -sn "$target"
            ;;
        3)
            read -p "Enter target (IP address, hostname, or network): " target
            echo "Executing: nmap -Pn $target"
            nmap -Pn "$target"
            ;;
        4)
            read -p "Enter target (IP address, hostname, or network): " target
            read -p "Enter port list (e.g., 22,80,443): " ports
            echo "Executing: nmap -PS$ports $target"
            nmap -PS"$ports" "$target"
            ;;
        5)
            read -p "Enter target (IP address, hostname, or network): " target
            echo "Executing: nmap -PE $target"
            nmap -PE "$target"
            ;;
        6)
            return_to_menu
            break
            ;;
        *)
            invalid_input
            ;;
        esac
        read -p "Press Enter to continue..."
    done
}


port_specification() {
    while true; do
        clear
        echo "Port Specification and Scan Order Menu:"
        echo "1. Scan specific port ranges (-p)"
        echo "2. Exclude specific port ranges (--exclude-ports)"
        echo "3. Fast mode (-F)"
        echo "4. Scan ports sequentially (-r)"
        echo "5. Scan top N most common ports (--top-ports)"
        echo "6. Scan ports more common than a ratio (--port-ratio)"
        echo "7. Go back to Main Menu"
        read -p "Select an option: " choice

        case $choice in
        1)
            read -p "Enter target (IP address, hostname, or network): " target
            read -p "Enter port ranges (e.g., 22; 1-65535; U:53,111,T:21-25): " ports
            echo "Executing: nmap -p $ports $target"
            nmap -p "$ports" "$target"
            ;;
        2)
            read -p "Enter target (IP address, hostname, or network): " target
            read -p "Enter ports to exclude (e.g., 80,443): " exclude_ports
            echo "Executing: nmap --exclude-ports $exclude_ports $target"
            nmap --exclude-ports "$exclude_ports" "$target"
            ;;
        3)
            read -p "Enter target (IP address, hostname, or network): " target
            echo "Executing: nmap -F $target"
            nmap -F "$target"
            ;;
        4)
            read -p "Enter target (IP address, hostname, or network): " target
            echo "Executing: nmap -r $target"
            nmap -r "$target"
            ;;
        5)
            read -p "Enter target (IP address, hostname, or network): " target
            read -p "Enter number of top ports to scan: " top_ports
            echo "Executing: nmap --top-ports $top_ports $target"
            nmap --top-ports "$top_ports" "$target"
            ;;
        6)
            read -p "Enter target (IP address, hostname, or network): " target
            read -p "Enter port ratio: " ratio
            echo "Executing: nmap --port-ratio $ratio $target"
            nmap --port-ratio "$ratio" "$target"
            ;;
        7)
            break
            ;;
        *)
            echo "Invalid input."
            ;;
        esac
        read -p "Press Enter to continue..."
    done
}


service_version_detection() {
    while true; do
        clear
        echo "Service/Version Detection Menu:"
        echo "1. Probe open ports to determine service/version info (-sV)"
        echo "2. Set version intensity level (--version-intensity)"
        echo "3. Limit to most likely probes (light scan) (--version-light)"
        echo "4. Try every single probe (intensity 9) (--version-all)"
        echo "5. Show detailed version scan activity (--version-trace)"
        echo "6. Go back to Main Menu"
        read -p "Select an option: " choice

        case $choice in
        1)
            read -p "Enter target (IP address, hostname, or network): " target
            echo "Executing: nmap -sV $target"
            nmap -sV "$target"
            ;;
        2)
            read -p "Enter target (IP address, hostname, or network): " target
            read -p "Enter version intensity level (0 to 9): " intensity
            echo "Executing: nmap --version-intensity $intensity $target"
            nmap --version-intensity "$intensity" "$target"
            ;;
        3)
            read -p "Enter target (IP address, hostname, or network): " target
            echo "Executing: nmap --version-light $target"
            nmap --version-light "$target"
            ;;
        4)
            read -p "Enter target (IP address, hostname, or network): " target
            echo "Executing: nmap --version-all $target"
            nmap --version-all "$target"
            ;;
        5)
            read -p "Enter target (IP address, hostname, or network): " target
            echo "Executing: nmap --version-trace $target"
            nmap --version-trace "$target"
            ;;
        6)
            break
            ;;
        *)
            echo "Invalid input."
            ;;
        esac
        read -p "Press Enter to continue..."
    done
}


os_detection() {
    while true; do
        clear
        echo "OS Detection Menu:"
        echo "1. Enable OS detection (-O)"
        echo "2. Limit OS detection to promising targets (--osscan-limit)"
        echo "3. Guess OS more aggressively (--osscan-guess)"
        echo "4. Go back to Main Menu"
        read -p "Select an option: " choice

        case $choice in
        1)
            read -p "Enter target (IP address, hostname, or network): " target
            echo "Executing: nmap -O $target"
            nmap -O "$target"
            ;;
        2)
            read -p "Enter target (IP address, hostname, or network): " target
            echo "Executing: nmap --osscan-limit $target"
            nmap --osscan-limit "$target"
            ;;
        3)
            read -p "Enter target (IP address, hostname, or network): " target
            echo "Executing: nmap --osscan-guess $target"
            nmap --osscan-guess "$target"
            ;;
        4)
            break
            ;;
        *)
            echo "Invalid input."
            ;;
        esac
        read -p "Press Enter to continue..."
    done
}


timing_and_performance() {
    while true; do
        clear
        echo "Timing and Performance Menu:"
        echo "1. Set timing template (-T<0-5>)"
        echo "2. Set parallel host scan group sizes (--min-hostgroup/max-hostgroup)"
        echo "3. Adjust probe parallelization (--min-parallelism/max-parallelism)"
        echo "4. Set RTT timeouts (--min-rtt-timeout/max-rtt-timeout/initial-rtt-timeout)"
        echo "5. Cap number of retries (--max-retries)"
        echo "6. Set host timeout (--host-timeout)"
        echo "7. Adjust scan delay (--scan-delay/--max-scan-delay)"
        echo "8. Set minimum packet rate (--min-rate)"
        echo "9. Set maximum packet rate (--max-rate)"
        echo "10. Go back to Main Menu"
        read -p "Select an option: " choice

        case $choice in
        1)
            read -p "Enter target (IP address, hostname, or network): " target
            read -p "Enter timing template (0-5): " timing
            echo "Executing: nmap -T$timing $target"
            nmap -T"$timing" "$target"
            ;;
        2)
            read -p "Enter target (IP address, hostname, or network): " target
            read -p "Enter minimum host group size: " min_hostgroup
            read -p "Enter maximum host group size: " max_hostgroup
            echo "Executing: nmap --min-hostgroup $min_hostgroup --max-hostgroup $max_hostgroup $target"
            nmap --min-hostgroup "$min_hostgroup" --max-hostgroup "$max_hostgroup" "$target"
            ;;
        3)
            read -p "Enter target (IP address, hostname, or network): " target
            read -p "Enter minimum parallel probes: " min_parallelism
            read -p "Enter maximum parallel probes: " max_parallelism
            echo "Executing: nmap --min-parallelism $min_parallelism --max-parallelism $max_parallelism $target"
            nmap --min-parallelism "$min_parallelism" --max-parallelism "$max_parallelism" "$target"
            ;;
        4)
            read -p "Enter target (IP address, hostname, or network): " target
            read -p "Enter initial RTT timeout (e.g., 30ms, 1s): " initial_rtt
            read -p "Enter minimum RTT timeout (e.g., 30ms, 1s): " min_rtt
            read -p "Enter maximum RTT timeout (e.g., 30ms, 1s): " max_rtt
            echo "Executing: nmap --initial-rtt-timeout $initial_rtt --min-rtt-timeout $min_rtt --max-rtt-timeout $max_rtt $target"
            nmap --initial-rtt-timeout "$initial_rtt" --min-rtt-timeout "$min_rtt" --max-rtt-timeout "$max_rtt" "$target"
            ;;
        5)
            read -p "Enter target (IP address, hostname, or network): " target
            read -p "Enter maximum retries: " retries
            echo "Executing: nmap --max-retries $retries $target"
            nmap --max-retries "$retries" "$target"
            ;;
        6)
            read -p "Enter target (IP address, hostname, or network): " target
            read -p "Enter host timeout (e.g., 30ms, 1s): " timeout
            echo "Executing: nmap --host-timeout $timeout $target"
            nmap --host-timeout "$timeout" "$target"
            ;;
        7)
            read -p "Enter target (IP address, hostname, or network): " target
            read -p "Enter scan delay (e.g., 30ms, 1s): " scan_delay
            read -p "Enter maximum scan delay (e.g., 30ms, 1s): " max_scan_delay
            echo "Executing: nmap --scan-delay $scan_delay --max-scan-delay $max_scan_delay $target"
            nmap --scan-delay "$scan_delay" --max-scan-delay "$max_scan_delay" "$target"
            ;;
        8)
            read -p "Enter target (IP address, hostname, or network): " target
            read -p "Enter minimum packet rate: " min_rate
            echo "Executing: nmap --min-rate $min_rate $target"
            nmap --min-rate "$min_rate" "$target"
            ;;
        9)
            read -p "Enter target (IP address, hostname, or network): " target
            read -p "Enter maximum packet rate: " max_rate
            echo "Executing: nmap --max-rate $max_rate $target"
            nmap --max-rate "$max_rate" "$target"
            ;;
        10)
            break
            ;;
        *)
            echo "Invalid input."
            ;;
        esac
        read -p "Press Enter to continue..."
    done
}


configure_output_options() {
    while true; do
        clear
        echo "Output Options Menu:"
        echo "1. Normal output (-oN)"
        echo "2. XML output (-oX)"
        echo "3. Script kiddie output (-oS)"
        echo "4. Grepable output (-oG)"
        echo "5. Output in all formats (-oA)"
        echo "6. Increase verbosity (-v or -vv)"
        echo "7. Enable debugging (-d or -dd)"
        echo "8. Show packet trace (--packet-trace)"
        echo "9. Show reason for port states (--reason)"
        echo "10. Use custom stylesheet (--stylesheet)"
        echo "11. Resume aborted scan (--resume)"
        echo "12. Append output to file (--append-output)"
        echo "13. Disable runtime interaction (--noninteractive)"
        echo "14. Done"
        read -p "Select an output option: " choice

        case $choice in
        1)
            output_format="-oN"
            read -p "Enter filename for output: " output_file
            output_args="$output_format $output_file"
            ;;
        2)
            output_format="-oX"
            read -p "Enter filename for output: " output_file
            output_args="$output_format $output_file"
            ;;
        3)
            output_format="-oS"
            read -p "Enter filename for output: " output_file
            output_args="$output_format $output_file"
            ;;
        4)
            output_format="-oG"
            read -p "Enter filename for output: " output_file
            output_args="$output_format $output_file"
            ;;
        5)
            read -p "Enter base filename for output: " base_file
            output_args="-oA $base_file"
            ;;
        6)
            read -p "Enter verbosity level (v for normal, vv for more): " verbosity
            output_args="$verbosity"
            ;;
        7)
            read -p "Enter debugging level (d for normal, dd for more): " debugging
            output_args="$debugging"
            ;;
        8)
            output_args="--packet-trace"
            ;;
        9)
            output_args="--reason"
            ;;
        10)
            read -p "Enter stylesheet path/URL: " stylesheet
            output_args="--stylesheet $stylesheet"
            ;;
        11)
            read -p "Enter filename to resume from: " resume_file
            output_args="--resume $resume_file"
            ;;
        12)
            output_args="--append-output"
            ;;
        13)
            output_args="--noninteractive"
            ;;
        14)
            break
            ;;
        *)
            echo "Invalid input. Try again."
            ;;
        esac
        read -p "Press Enter to continue..."
    done
}


configure_firewall_evasion() {
    while true; do
        clear
        echo "FIREWALL/IDS EVASION AND SPOOFING MENU:"
        echo "1. Fragment packets (--mtu)"
        echo "2. Cloak scan with decoys (-D)"
        echo "3. Spoof source address (-S)"
        echo "4. Use specified interface (-e)"
        echo "5. Use a specific source port (-g/--source-port)"
        echo "6. Relay connections through proxies (--proxies)"
        echo "7. Append custom payload in hex (--data)"
        echo "8. Append custom ASCII string (--data-string)"
        echo "9. Append random data (--data-length)"
        echo "10. Send packets with specific IP options (--ip-options)"
        echo "11. Set IP time-to-live (--ttl)"
        echo "12. Spoof MAC address (--spoof-mac)"
        echo "13. Use bogus checksum (--badsum)"
        echo "14. Done"
        read -p "Select an option: " choice

        case $choice in
        1)
            read -p "Enter MTU value (e.g., 8, 16, etc.): " mtu_value
            firewall_args+=" --mtu $mtu_value"
            ;;
        2)
            read -p "Enter decoys (comma-separated, e.g., 192.168.1.1,192.168.1.2,ME): " decoys
            firewall_args+=" -D $decoys"
            ;;
        3)
            read -p "Enter IP address to spoof: " spoof_ip
            firewall_args+=" -S $spoof_ip"
            ;;
        4)
            read -p "Enter network interface to use (e.g., eth0, wlan0): " interface
            firewall_args+=" -e $interface"
            ;;
        5)
            read -p "Enter source port number: " source_port
            firewall_args+=" -g $source_port"
            ;;
        6)
            read -p "Enter proxies (comma-separated URLs, e.g., http://proxy1,http://proxy2): " proxies
            firewall_args+=" --proxies $proxies"
            ;;
        7)
            read -p "Enter custom payload in hex: " hex_payload
            firewall_args+=" --data $hex_payload"
            ;;
        8)
            read -p "Enter custom ASCII string: " ascii_payload
            firewall_args+=" --data-string \"$ascii_payload\""
            ;;
        9)
            read -p "Enter the length of random data to append: " data_length
            firewall_args+=" --data-length $data_length"
            ;;
        10)
            read -p "Enter IP options (e.g., RR, TS, LS, SS): " ip_options
            firewall_args+=" --ip-options $ip_options"
            ;;
        11)
            read -p "Enter TTL value: " ttl_value
            firewall_args+=" --ttl $ttl_value"
            ;;
        12)
            read -p "Enter MAC address to spoof (or vendor prefix): " mac_address
            firewall_args+=" --spoof-mac $mac_address"
            ;;
        13)
            echo "Adding bogus checksum to packets."
            firewall_args+=" --badsum"
            ;;
        14)
            break
            ;;
        *)
            echo "Invalid input. Please try again."
            ;;
        esac
        read -p "Press Enter to continue..."
    done
}


configure_misc_options() {
    while true; do
        clear
        echo "MISC OPTIONS MENU:"
        echo "1. Enable IPv6 scanning (-6)"
        echo "2. Enable OS detection, version detection, script scanning, and traceroute (-A)"
        echo "3. Specify custom Nmap data file location (--datadir)"
        echo "4. Send using raw ethernet frames (--send-eth)"
        echo "5. Send using raw IP packets (--send-ip)"
        echo "6. Assume fully privileged (--privileged)"
        echo "7. Assume unprivileged (--unprivileged)"
        echo "8. Print Nmap version (-V)"
        echo "9. Print help summary (-h)"
        echo "10. Done"
        read -p "Select an option: " choice

        case $choice in
        1)
            echo "Enabling IPv6 scanning."
            misc_args+=" -6"
            ;;
        2)
            echo "Enabling OS detection, version detection, script scanning, and traceroute."
            misc_args+=" -A"
            ;;
        3)
            read -p "Enter the directory path for custom Nmap data files: " datadir
            misc_args+=" --datadir $datadir"
            ;;
        4)
            echo "Using raw ethernet frames for sending packets."
            misc_args+=" --send-eth"
            ;;
        5)
            echo "Using raw IP packets for sending."
            misc_args+=" --send-ip"
            ;;
        6)
            echo "Assuming user is fully privileged."
            misc_args+=" --privileged"
            ;;
        7)
            echo "Assuming user is unprivileged."
            misc_args+=" --unprivileged"
            ;;
        8)
            echo "Nmap version:"
            nmap -V
            read -p "Press Enter to continue..."
            ;;
        9)
            echo "Nmap help summary:"
            nmap -h
            read -p "Press Enter to continue..."
            ;;
        10)
            break
            ;;
        *)
            echo "Invalid input. Please try again."
            ;;
        esac
        read -p "Press Enter to continue..."
    done
}


main() {
    scan_args=""
    output_args=""
    firewall_args=""
    misc_args=""

    while true; do
        clear
        echo "MAIN MENU:"
        echo "1. Target Specification"
        echo "2. Host Discovery"
        echo "3. Scan Techniques"
        echo "4. Port Specification and Scan Order"
        echo "5. Service/Version Detection"
        echo "6. OS Detection"
        echo "7. Timing and Performance"
        echo "8. Firewall/IDS Evasion and Spoofing"
        echo "9. Miscellaneous Options"
        echo "10. Output Configuration"
        echo "11. Run Nmap Scan"
        echo "12. Exit"
        read -p "Select an option: " main_choice

        case $main_choice in
        1)
            configure_target_specification
            ;;
        2)
            configure_host_discovery
            ;;
        3)
            configure_scan_techniques
            ;;
        4)
            configure_port_specification
            ;;
        5)
            configure_service_detection
            ;;
        6)
            configure_os_detection
            ;;
        7)
            configure_timing_performance
            ;;
        8)
            configure_firewall_evasion
            ;;
        9)
            configure_misc_options
            ;;
        10)
            configure_output
            ;;
        11)
            echo "Constructing and running Nmap scan..."
            nmap $scan_args $output_args $firewall_args $misc_args
            read -p "Press Enter to return to the main menu..."
            ;;
        12)
            echo "Exiting. Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
        esac
    done
}
