{% set ips = salt['mine.get']('*', 'network.ipaddrs') %}

# Add all hosts in our system to the hosts file
{% for host, ip in ips.items() %}

{{ host }}:
  host.present:
    - ip: {{ ip if host != grains['id'] else '127.0.0.1' }}
    - require_in:
      - cmd: hosts-done

{% endfor %}

# A noop that fires when all hosts are present
hosts-done:
  cmd.run:
    - name: date > /dev/null