{% from "horizon/map.jinja" import horizon with context %}

horizon:
  pkg.installed:
    - refresh: False
    - pkgs: {{ horizon.pkgs }}
  service.running:
    - enable: True
    - reload: True
    - names: {{ horizon.services }}
    - require:
      - pkg: horizon
    - watch:
      - file: /etc/openstack-dashboard/ubuntu_theme.py

/etc/openstack-dashboard/ubuntu_theme.py:
  file.absent
