import os
import shutil


def build_docker_compose(port_start=1000, limit=30):
    with open('docker-compose.yaml', 'w') as ofp:
        ofp.write("""
version: '2'
services:
""")
        for i in range(limit):
            ofp.write('''
  myjulab_{ndx}:
    image: "mcchae/julab"
    hostname: "jupyterlab-{ndx}"
    volumes:
      - /root/work/dhv/python-bootcamp-{ndx}:/notebook
    ports:
      - "{ndx}:8888"
'''.format(ndx=port_start+i))
            pb = 'dhv/python-bootcamp-%d' % (port_start+i,)
            if not os.path.exists(pb):
                os.system('cp -a python-bootcamp %s' % pb)
            print('[%d] done.' % (port_start+i,))
            os.system('echo "iptables -I INPUT 1 -p tcp --dport %d -j ACCEPT" >> /etc/systemd/scripts/iptables' % (port_start+i,))
    os.system('systemctl restart iptables')

if __name__ == '__main__':
    build_docker_compose()
