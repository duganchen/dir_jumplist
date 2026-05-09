_jgc() {
	# Garbage collect the list

	if [[ -f ~/.dir_jumplist.txt ]]; then
		# https://www.reddit.com/r/zsh/comments/tt6gm8/why_doesnt_zsh_have_an_equivalent_of_bashs/
		local jumplist=("${(f)$(< ~/.dir_jumplist.txt)}")

		local -a notfound
		for dir in $jumplist; do
			if [[ ! -d $dir ]]; then
				notfound+=($dir)
			fi
		done

		if [ ${#notfound} -ne 0 ]; then
			# Removal syntax:
			# https://stackoverflow.com/a/52188874
			jumplist=${jumplist:|notfound}
		fi

		print -l $jumplist > ~/.dir_jumplist.txt
	fi
}

ja() {
	_jgc

	if [ -f ~/.dir_jumplist.txt ]; then
		local jumplist=("${(f)$(< ~/.dir_jumplist.txt)}")
		# Don't look at me; I just got this from AI
		# It's 'if $jumplist does not contain $PWD'
		if (( ${jumplist[(Ie)$PWD]} == 0 )); then
			jumplist+=($PWD)
		fi
		print -l $jumplist > ~/.dir_jumplist.txt
	else
		echo $PWD >~/.dir_jumplist.txt
	fi
}
