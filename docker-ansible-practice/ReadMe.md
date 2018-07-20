# Docker Ansible
## Ansible Practice
### 설명
* Ansible
* Ansible Tower (Visualization:Dash Board)

### 환경
---
#### OS
CentOS 7
Python(2.7? 이상) * Ansible
* Ansible Tower (Visualization:Dash Board)

#### Ansible 설명
1. Ansible?
Ansible은 구성관리 툴이라고 보면 된다.  Ansible설정으로 원격지 2개 이상의 서버에 파일을 보내거나 조작을 한다. 크래 아래와 같은 구성이 된다.
  * Ansible 서버 (관리 호스트 PC)
  * Ansible에 의해 관리되는 서버(여러대)

2. Ansible 설정파일
  * Inventory 파일
    * 대상서버의 정보(IP, ssh키정보등 ini형식으로 기술함)
  * Playbook 파일
    * Inventory파일에 기술되어 있는 서버들에게 명령 및 조작 (yml형식으로 기술함)

#### Ansible 설정
##### 필요 환경

#### Ansible 인스툴
링크(https://pkgs.org/download/ansible)
```
> wget http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/a/ansible-2.6.1-1.el7.noarch.rpm
>

wget http://mirror.centos.org/centos/7/os/x86_64/Packages/libyaml-0.1.4-11.el7_0.x86_64.rpm
rpm -Uvh libyaml-0.1.4-11.el7_0.x86_64.rpm

wget http://mirror.centos.org/centos/7/os/x86_64/Packages/PyYAML-3.10-11.el7.x86_64.rpm
rpm -Uvh PyYAML-3.10-11.el7.x86_64.rpm

wget http://mirror.centos.org/centos/7/extras/x86_64/Packages/python-crypto-2.6.1-1.el7.centos.x86_64.rpm
rpm -Uvh python-crypto-2.6.1-1.el7.centos.x86_64.rpm

wget http://mirror.centos.org/centos/7/extras/x86_64/Packages/python-httplib2-0.9.2-1.el7.noarch.rpm
rpm -Uvh python-httplib2-0.9.2-1.el7.noarch.rpm

wget http://mirror.centos.org/centos/7/os/x86_64/Packages/python-babel-0.9.6-8.el7.noarch.rpm
rpm -Uvh python-babel-0.9.6-8.el7.noarch.rpm

wget http://mirror.centos.org/centos/7/os/x86_64/Packages/python-markupsafe-0.11-10.el7.x86_64.rpm
rpm -Uvh python-markupsafe-0.11-10.el7.x86_64.rpm

wget http://mirror.centos.org/centos/7/os/x86_64/Packages/python-jinja2-2.7.2-2.el7.noarch.rpm
rpm -Uvh python-jinja2-2.7.2-2.el7.noarch.rpm

wget http://mirror.centos.org/centos/7/os/x86_64/Packages/python2-pyasn1-0.1.9-7.el7.noarch.rpm
rpm -Uvh python2-pyasn1-0.1.9-7.el7.noarch.rpm

wget http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/p/python-keyczar-0.71c-2.el7.noarch.rpm
rpm -Uvh python-keyczar-0.71c-2.el7.noarch.rpm

wget http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/p/python-paramiko-2.1.1-0.4.el7.noarch.rpm


위와 같이 하였더니 안될듯,, 디펜던시 관련 라이브러리가 없는 경우가 발생됨.. 이는 찾아서 해보아야 할듯하다. 하여 아래와 같이 설치 작업을 진행

// eple을 인스툴하여 Ansible이 인스툴 되도록 한다.
> yum -y install epel-release
> yum -y install ansible


```

### 참조
* 참조: https://github.com/yuizho/ansible_vagrant_balancer_sample
* 참조: https://pkgs.org/download/ansible
* 참조: https://www.slideshare.net/yuiito94/ansible-59682866
* 참조: https://www.osscons.jp/cloud/ダウンロード/?action=common_download_main&upload_id=699
* 참조: https://career.levtech.jp/hikalab/report/detail/34/
* 참조: https://www.scsk.jp/lib/product/oss/pdf/Ansible.pdf
* 참조: https://liginc.co.jp/288071
* 참조: https://thinkit.co.jp/article/9990
* 참조: http://labs.opentone.co.jp/?p=6497
* 참조: https://qiita.com/sunack/items/273ac7f71faf99088e4d
* 참조: https://www.ossnews.jp/closeup/articles/?aid=201705-00001
* 참조: https://thenewstack.io/red-hat-ansible-aims-simplify-automation-tower-3/
* 참조: https://thinkit.co.jp/article/11736
* 참조: https://qiita.com/ch7821/items/22735f2a9c8f7e0d4b2c
* 참조: https://qiita.com/nekonoprotocol/items/78884242064cdaf9f472
* 참조: https://dev.classmethod.jp/server-side/ansible/practice_ansible/
* 참조: https://qiita.com/suicacello/items/ab5c80cb52bb9ff92704
* 참조: https://github.com/ansible/ansible
* 참조: https://qiita.com/t_nakayama0714/items/fe55ee56d6446f67113c
* 참조: https://dev.classmethod.jp/server-side/ansible/practice_ansible/
