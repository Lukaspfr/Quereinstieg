WSL-Service/Logs Debugging-Fallback (Merkschema)

- Symptom: “Service läuft nicht / systemctl geht nicht”

	- Check Prozess: pgrep -a <name> oder ps aux | grep <name>

	- Check Port: ss -tulnp | grep :<port>

	- Logs: tail -n 50 <logfile> oder App im Vordergrund starten mit -v/--log-level debug
