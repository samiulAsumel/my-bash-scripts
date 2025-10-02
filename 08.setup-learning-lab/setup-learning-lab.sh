#!/bin/bash
# setup-learning-lab.sh
# This script creates an organized learning environment

echo "Setting up your professional Linux learning lab..."

# Create directory structure
mkdir -p ~/linux-projects/{bin,configs,docs,scripts,logs,backups}
mkdir -p ~/linux-projects/docs/{cheatsheets,notes,tutorials}
mkdir -p ~/linux-projects/scripts/{system,database,network,security}

# Create basic documentation
echo "Linux Learning Journey" > ~/linux-projects/README.md
echo "Started: $(date)" >> ~/linux-projects/README.md
echo "Goals: RHCSA, RHCE, DevOps Engineer" >> ~/linux-projects/README.md

# Create command history tracking
echo "export HISTFILE=~/linux-projects/logs/.bash_history" >> ~/.bashrc
echo "export HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S'" >> ~/.bashrc
echo 'if [[ $PROMPT_COMMAND != *"history"* ]]; then
    export PROMPT_COMMAND="history -a; history -c; history -r; ${PROMPT_COMMAND:-}"
fi' >> ~/.bashrc

echo "Linux learning lab setup complete!"