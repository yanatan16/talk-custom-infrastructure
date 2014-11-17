include:
  - common.oracle-java7

/usr/bin/lein:
  file.managed:
    - source: https://raw.github.com/technomancy/leiningen/stable/bin/lein
    - source_hash: md5=56680a15d5df82e6cf74f4bcac876adc ## cat lein | md5sum
    - mode: 755

lein:
  cmd.run:
    - name: 'lein version'
    - require:
      - pkg: jdk7
      - file: /usr/bin/lein
