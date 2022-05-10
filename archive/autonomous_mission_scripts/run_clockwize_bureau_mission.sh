# Lance le groupe de waypoints parcourant l'étage dans le sens horaire et commence et termine dans le bureau SHAKER

#! /bin/bash
rosservice call /waypoint_server/run_wp "wp_name: ''
gr_name: 'etage_clockwize_bureau'
loop: false
index: 0" 

