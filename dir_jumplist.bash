_jgc() {
	# Garbage collect the list
	# Requires Bash 4

	local -a jumplist=()
	if [ -f ~/.dir_jumplist.txt ]; then
		# https://stackoverflow.com/a/30988704
		mapfile -t jumplist <~/.dir_jumplist.txt

		for i in "${!jumplist[@]}"; do
			if [[ ! -d "${jumplist[$i]}" ]]; then
				unset "jumplist[$i]"
			fi
		done
		jumplist=("${jumplist[@]}")

		printf "%s\n" "${jumplist[@]}" >~/.dir_jumplist.txt
	fi
}

ja() {
	_jgc

	if [ -f ~/.dir_jumplist.txt ]; then
		local -a jumplist=()
		mapfile -t jumplist <~/.dir_jumplist.txt
		local found=0
		for dir in "${jumplist[@]}"; do
			if [[ "$dir" == "$PWD" ]]; then
				found=1
				break
			fi
		done

		if [[ found -eq 1 ]]; then
			printf "%s\n" "${jumplist[@]}" >~/.dir_jumplist.txt
		else
			echo "$PWD" >>~/.dir_jumplist.txt
		fi
	fi
}

jn() {
	_jgc

	if [ -f ~/.dir_jumplist.txt ]; then
		local -a jumplist=()
		mapfile -t jumplist <~/.dir_jumplist.txt

		local found=0
		for i in "${!jumplist[@]}"; do
			if [[ "$PWD" == "${jumplist[$i]}" ]]; then
				found=1
				break
			fi
		done

		if [ $found -eq 1 ]; then
			if [ "$i" -eq "$((${#jumplist[@]} - 1))" ]; then
				cd "${jumplist[0]}" || return
			else

				i=$((i + 1))
				cd "${jumplist[$i]}" || return
			fi
		else
			cd "${jumplist[0]}" || return
		fi
	fi
}
