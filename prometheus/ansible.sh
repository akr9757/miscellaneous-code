#ssh_username=${aws ssm get-parameter  --name "ssh.username" --with-decryption --query "parameter.value" --output text}
#ssh_password=${aws ssm get-parameter  --name "ssh.password" --with-decryption --query "parameter.value" --output text}

# shellcheck disable=SC2154
ssh_username=${aws ssm get-parameter --name "ssh.username" --query "Parameter.Value" --output text}
ssh_password=${aws ssm get-parameter --name "ssh.password" --query "Parameter.Value" --output text}

ansible-playbook -i prometheus-pvt.akrdevops.online, prometheus.yml -e ansible_user=${ssh_username} -e ansible_password=$ssh_password