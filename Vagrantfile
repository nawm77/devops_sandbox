# Vagrant.configure("2") do |config|
#   config.vm.box = "spox/ubuntu-arm"
#   config.vm.box_version = "1.0.0"
#   config.vm.provider :vmware_desktop do |vmware|
#     vmware.gui = true
#     vmware.cpus = 2
#     vmware.vmx["ethernet0.virtualdev"] = "vmxnet3"
#     vmware.ssh_info_public = true
#     vmware.linked_clone = false
#   end
# end


nodes = [
    { :hostname => 'ubuntu1-master', :ip => '10.245.1.222', :memory => 2048, :cpu => 1, :boxname => 'spox/ubuntu-arm' },
    { :hostname => 'ubuntu2-master', :ip => '10.245.1.223', :memory => 2048, :cpu => 1, :boxname => 'spox/ubuntu-arm' },
    { :hostname => 'ubuntu3-worker', :ip => '10.245.1.224', :memory => 1536, :cpu => 1, :boxname => 'spox/ubuntu-arm' },
    { :hostname => 'ubuntu4-host', :ip => '10.245.1.225', :memory => 1024, :cpu => 1, :boxname => 'spox/ubuntu-arm' }
]

Vagrant.configure("2") do |config|
    nodes.each do |node|
        config.vm.box_check_update = false
        config.vm.define node[:hostname] do |nodeconfig|
            nodeconfig.vm.box = node[:boxname]
            nodeconfig.vm.hostname = node[:hostname]
            nodeconfig.vm.network :private_network, ip: node[:ip]
            nodeconfig.vm.provider :vmware_desktop do |vmware|
                vmware.gui = true
                vmware.cpus = node[:cpu]
                vmware.memory = node[:memory]
                vmware.vmx["ethernet0.virtualdev"] = "vmxnet3"
                vmware.ssh_info_public = true
                vmware.linked_clone = false
           end
        end
        config.vm.provision "ansible" do |ansible|
            ansible.playbook = "playbook.yml"
        end
    end
end

