echo "" 
echo "                                                                              _            ____                 _      ___  _     "
echo "                                                                    __ _  ___| |_         / ___|_ __ __ _ _ __ | |__  / _ \| |    "
echo "                                                                   / _  |/ _ \ __|  ___  | |  _|  __/ _  |  _ \|  _ \| | | | |    "
echo "                                                                  | (_| |  __/ |_  |___| | |_| | | | (_| | |_) | | | | |_| | |__  "
echo "                                                                   \__, |\___|\__\        \____|_|  \__,_| .__/|_| |_|\__\_\____| "
echo "                                                                   |___/                                 |_|                      "
echo ""  
echo "                                                                                    get-GraphQL by @utkarsh24122"




target=$1

echo ""
echo " "
echo "input file ===> $target"
echo ""

echo $target | cut -d . -f1 >> log.txt
read -r foo<log.txt ; rm -f log.txt

mkdir "$foo"_graphql

cp "$target" ./"$foo"_graphql/"$target"

cd "$foo"_graphql

pwd >> log.txt
read -r foo2<log.txt ;rm -f log.txt


echo ""
echo -e "\n\e[36m[\e[32m+\e[36m]\e[92m Output directory : "$foo2" \e[0m\n" 
echo ""



echo ""
echo -e "\n\e[36m[\e[32m+\e[36m]\e[92m Getting template ... \e[0m\n" 
echo ""
wget -q https://raw.githubusercontent.com/utkarsh24122/get-GraphQL/main/get-graphql.yaml
echo "                 api_endpoints.yaml           100%[====================================================================================================>]   2.09K  --.-KB/s "
echo ""


echo ""
echo -e "\n\e[36m[\e[32m+\e[36m]\e[92m Finding GraphQL Endpoints ... \e[0m\n" 
cat $target | httpx -silent | nuclei -silent -t get-graphql.yaml -o graphql.txt
echo ""


echo ""
echo -e "\n\e[36m[\e[32m+\e[36m]\e[92m Extracting links and sorting ... \e[0m\n" 
echo ""
echo ""

cat graphql.txt | cut -d " " -f6 | sort -u >> graphql-endpoints.txt
rm graphql.txt

cat graphql-endpoints.txt | wc -l >> log.txt
read -r foo3<log.txt ;rm -f log.txt
rm get-graphql.yaml
echo -e "\n\e[36m[\e[32m+\e[36m]\e[92m "$foo3" API Endpoints found and saved in "$foo2"/graphql-endpoints.txt \e[0m\n" 
echo ""
echo ""
echo -e "\n\e[36m[\e[32m+\e[36m]\e[92m Scan Complete!!! Exiting ... \e[0m\n" 
echo ""
