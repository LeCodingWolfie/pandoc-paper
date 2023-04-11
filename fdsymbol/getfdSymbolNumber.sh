###############################
# In fdSymbol, DeclareSymbol increases a LaTeX-native counter (i.e. \@tempcnta) [1] in every declaration, where it's passed as an argument via \the macro to be accessed [2].
# Therefore, the script counts the number of declarations.
#
# [1]: https://tex.stackexchange.com/q/88252
# [2]: https://tex.stackexchange.com/a/38680
################################

symbol="smallblackdiamond"

# Extracts the line number at which the symbol is declared
line=$(cat fdsymbol.dtx | grep -n "\\\fdsy@DeclareSymbol{\\\\$symbol}" | cut -d ":" -f1)

# Outputs the file contents until the line is reached; then, outputs all the declarations up to that line, and counts the number of ocurrences
cat fdsymbol.dtx | head -n $line | grep "\\\fdsy@DeclareSymbol{" | wc -l
