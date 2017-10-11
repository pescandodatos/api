for i in $( ls app/datos/ ); do
    echo item: ${i}
    iconv -c -f utf-8 -t ascii i > app/datos/i
done