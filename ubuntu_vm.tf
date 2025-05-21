resource "google_service_account" "vm_instance_service_account" {
    account_id   = var.service_account_vm_name
    display_name = "Custom SA for VM Instance"
    depends_on = [ google_project_service.iam ]
}

resource "google_compute_instance" "ubuntu_vm"{
    name = var.vm_name
    machine_type = var.machine_type
    zone = var.zone
    tags = ["http-client"]
    
    boot_disk {
      initialize_params {
        image = var.image
      }
    }

    network_interface {
       network = data.google_compute_network.vpc_network.name
       subnetwork = data.google_compute_subnetwork.subnetwork[2].name
    }

    metadata_startup_script = <<-EOF
    #!/bin/bash
    apt update && apt upgrade -y
    apt install -y ubuntu-gnome-desktop tightvncserver

    # יצירת יוזר וסיסמה ל־VNC
    mkdir -p /home/ubuntu/.vnc
    echo "123456" | vncpasswd -f > /home/ubuntu/.vnc/passwd
    chmod 600 /home/ubuntu/.vnc/passwd
    chown -R ubuntu:ubuntu /home/ubuntu/.vnc

    # יצירת סקריפט xstartup
    cat <<EOT > /home/ubuntu/.vnc/xstartup
    #!/bin/sh
    export XKL_XMODMAP_DISABLE=1
    unset SESSION_MANAGER
    unset DBUS_SESSION_BUS_ADDRESS
    gnome-session &
    EOT

    chmod +x /home/ubuntu/.vnc/xstartup
    chown ubuntu:ubuntu /home/ubuntu/.vnc/xstartup

    # הרצת VNC כמשתמש ubuntu
    su - ubuntu -c "vncserver :1"
    EOF

    service_account {
      email = google_service_account.vm_instance_service_account.email
      scopes = ["cloud-platform"]
    }
    depends_on = [google_project_service.compute]
}
