FROM erikvl87/languagetool:6.7-dockerupdate-3@sha256:e1ea6a97538848ba824076ee197eccdc81e5faeeac497512c74b2f556a1b5759

# Improving the spell checker
# http://wiki.languagetool.org/hunspell-support
# USER root
# COPY en_spelling_additions.txt en_spelling_additions.txt
# RUN  (echo; cat en_spelling_additions.txt) >> org/languagetool/resource/en/hunspell/spelling.txt
# USER languagetool
