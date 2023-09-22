sudo su
apt update && apt install qemu-kvm -y
qemu-img create -f raw 2012r2.img 40G
wget -O- --no-check-certificate http://drive.muavps.net/windows/Windows2012r2.gz | gunzip | dd of=2012r2.img
curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list && sudo apt update && sudo apt install ngrok -y
read -p "Paste authtoken here (Copy and Ctrl+V to paste then press Enter): " CRP
ngrok config add-authtoken $CRP
qemu-img resize 2012r2.img 64G
ngrok tcp 3389

