# Charge le fichier contenant les waypoints parcourant l'étage du lab-STICC dans le sens horaire
#! /bin/bash
rosservice call /waypoint_server/load_wp "file_name: 'etage_clockwize'"
