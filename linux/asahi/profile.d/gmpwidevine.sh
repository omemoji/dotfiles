# widevine-installer が入れる /etc/profile.d/gmpwidevine.sh の POSIX sh 版 (scripts/void.sh がインストールする)。
# 元のファイルは bash の [[ を使っていて、greetd が /bin/sh (dash) で /etc/profile を読むとエラーになり、
# MOZ_GMP_PATH が設定されず Firefox で Widevine が使えなくなる
case ":$MOZ_GMP_PATH:" in
*":/var/lib/widevine/gmp-widevinecdm/system-installed:"*) ;;
*)
    MOZ_GMP_PATH="${MOZ_GMP_PATH}${MOZ_GMP_PATH:+:}/var/lib/widevine/gmp-widevinecdm/system-installed"
    export MOZ_GMP_PATH
    ;;
esac
