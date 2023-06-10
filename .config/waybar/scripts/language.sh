content=$(hyprctl devices)

if [[ $content == *"Bulgarian"* ]]; then
    echo "bg"
elif [[ $content == *"Greek"* ]]; then
    echo "gr"
else
    echo "en"
fi
