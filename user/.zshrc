# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source $(dirname $(gem which colorls))/tab_complete.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
path+=(
    $(ruby -e 'puts File.join(Gem.user_dir, "bin")')
)

# Language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Aliases
alias ls="colorls --light --sd -A"
alias cd="z"
alias diary="nvim ~/MEGA/Personal/diary/$(date +%Y-%m-%d)"
alias rnote="flatpak run com.github.flxzt.rnote"

run() {
    if [ -z "$1" ]; then
        echo "Usage: run <command> [args...]"
        return 1
    fi

    "$@" > /dev/null 2>&1 & disown
}
view()
{
    if [ $# -ne 1 ]; then
        echo "Usage: pdf <file>"
        return 1
    fi

    firefox "$1" & disown
}
c()
{
    if [ $# -ne 2 ]; then
        echo "Usage: c <input_file> <output_file>"
        return 1
    fi

	gcc "$1.c" -o "$2.out" -Wall -Werror -Wextra -Wpedantic
}
cr()
{
    if [ $# -ne 2 ]; then
        echo "Usage: cr <input_file> <output_file>"
        return 1
    fi

	gcc "$1.c" -o "$2.out" -Wall -Werror -Wpedantic && "./$2.out"
}
except() {
    local patterns=()
    local command=()
    local files=()
    
    while [[ "$1" == "-p" ]]; do
        shift
        if [[ -z "$1" ]]; then
            echo "Error: Missing pattern after -p"
            return 1
        fi
        patterns+=("$1")
        shift
    done
    
    if [[ -z "$1" ]]; then
        echo "Error: Missing command"
        return 1
    fi
    
    while [[ "$1" && "$1" != *.* ]]; do
        command+=("$1")
        shift
    done
    
    while [[ "$1" ]]; do
        files+=("$1")
        shift
    done
    
    if [[ ${#files[@]} -eq 0 ]]; then
        echo "Error: No files specified"
        return 1
    fi
    
    local grep_pattern
    grep_pattern=$(printf "|%s" "${patterns[@]}")
    grep_pattern=${grep_pattern:1}
    
    local filtered_files
    filtered_files=($(printf "%s\n" "${files[@]}" | grep -Ev "$grep_pattern"))
    
    if [[ ${#filtered_files[@]} -eq 0 ]]; then
        echo "Error: No files left after filtering"
        return 1
    fi
    
    "${command[@]}" "${filtered_files[@]}"
}
enc() {
    declare -a recipients=()

    while [[ $# -gt 0 ]]; do
        case "$1" in
            -r)
                shift
                recipients+=("$1")
                shift
                ;;
            *)
                break
                ;;
        esac
    done

    if [ ${#recipients[@]} -eq 0 ]; then
        echo "Usage: encd -r <recipient1> [-r <recipient2> ...] <filename> [<filename2> ...]"
        return 1
    fi

    if [ $# -eq 0 ]; then
        echo "Usage: encd -r <recipient1> [-r <recipient2> ...] <filename> [<filename2> ...]"
        return 1
    fi

    for file in "$@"; do
        if [ "$file" != "-r" ]; then
            if [ -f "$file" ]; then
                gpg_args=()
                for recipient in "${recipients[@]}"; do
                    gpg_args+=("-r" "$recipient")
                done
                gpg "${gpg_args[@]}" --output "$file.gpg" --encrypt "$file"
            else
                echo "Unable to encrypt '$file'; no such file!"
            fi
        fi
    done
}
encd() {
    declare -a recipients=()

    while [[ $# -gt 0 ]]; do
        case "$1" in
            -r)
                shift
                recipients+=("$1")
                shift
                ;;
            *)
                break
                ;;
        esac
    done

    if [ ${#recipients[@]} -eq 0 ]; then
        echo "Usage: encd -r <recipient1> [-r <recipient2> ...] <filename> [<filename2> ...]"
        return 1
    fi

    if [ $# -eq 0 ]; then
        echo "Usage: encd -r <recipient1> [-r <recipient2> ...] <filename> [<filename2> ...]"
        return 1
    fi

    for file in "$@"; do
        if [ "$file" != "-r" ]; then
            if [ -f "$file" ]; then
                gpg_args=()
                for recipient in "${recipients[@]}"; do
                    gpg_args+=("-r" "$recipient")
                done
                gpg "${gpg_args[@]}" --output "$file.gpg" --encrypt "$file" && rm "$file"
            else
                echo "Unable to encrypt '$file'; no such file!"
            fi
        fi
    done
}
dec()
{
    if [ $# -eq 0 ]; then
        echo "Usage: decd <filename> [<filename2> ...]"
        return 1
    fi

    for file in "$@"; do
        if [ -f "$file" ]; then
            gpg --output "${file%.gpg}" --decrypt "$file"
        else
            echo "Unable to decrypt '$file'; no such file!"
        fi
    done
}
decd()
{
    if [ $# -eq 0 ]; then
        echo "Usage: decd <filename> [<filename2> ...]"
        return 1
    fi

    for file in "$@"; do
        if [ -f "$file" ]; then
            gpg --output "${file%.gpg}" --decrypt "$file" && rm "$file"
        else
            echo "Unable to decrypt '$file'; no such file!"
        fi
    done
}

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/powerlevel10k/powerlevel10k.zsh-theme

#[ -f "/home/malik/.ghcup/env" ] && source "/home/malik/.ghcup/env" # ghcup-env
[ -f "/home/malik/.ghcup/env" ] && source "/home/malik/.ghcup/env" # ghcup-env
eval "$(zoxide init zsh)"
