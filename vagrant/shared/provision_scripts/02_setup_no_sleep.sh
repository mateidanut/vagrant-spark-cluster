#!/bin/bash

echo "Setting up to prevent sleep..."

# Prevent sleep due to inactivity
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
