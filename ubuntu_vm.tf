resource "google_service_account" "vm_instance_service_account" {
    account_id   = var.service_account_vm_name
    display_name = "Custom SA for VM Instance"
    depends_on = [ google_project_service.iam ]
}

resource "google_compute_instance" "ubuntu_vm"{
    name = var.vm_name
    machine_type = var.machine_type
    zone = var.zone
    
    boot_disk {
      initialize_params {
        image = var.image
      }
    }

    network_interface {
       network = data.google_compute_network.vpc_network.name
       subnetwork = data.google_compute_subnetwork.subnetwork[2].name
    }

    metadata_startup_script = <<-EOT
      #!/bin/bash
      sudo apt update && sudo apt upgrade -y
      sudo apt install -y ubuntu-gnome-desktop
      sudo apt install -y tightvncserver
      echo "your_password" | vncpasswd -f > ~/.vnc/passwd
      chmod 600 ~/.vnc/passwd
      echo "gnome-session &" > ~/.vnc/xstartup
      chmod +x ~/.vnc/xstartup
      vncserver
    EOT
    
    tags = ["HTTP-CLIENT", "GNOME-VM"]

    service_account {
      email = google_service_account.vm_instance_service_account.email
      scopes = ["cloud-platform"]
    }
    depends_on = [google_project_service.compute]
}
