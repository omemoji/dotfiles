# widevine-installer が入れる /etc/profile.d/gmpwidevine.sh の POSIX sh 版 (scripts/linux.sh がインストールする)。
# 元のファイルは bash の [[ を使っていて、greetd が /bin/sh (dash) で /etc/profile を読むとエラーになり、
# MOZ_GMP_PATH が設定されず Firefox で Widevine が使えなくなる。
# Widevine が無い (アンインストールした) 場合は何もしない
_widevine_gmp=/var/lib/widevine/gmp-widevinecdm/system-installed
if [ -d "$_widevine_gmp" ]; then
    case ":$MOZ_GMP_PATH:" in
    *":$_widevine_gmp:"*) ;;
    *)
        MOZ_GMP_PATH="${MOZ_GMP_PATH}${MOZ_GMP_PATH:+:}$_widevine_gmp"
        export MOZ_GMP_PATH
        ;;
    esac
fi
unset _widevine_gmp
