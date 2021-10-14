# get-GraphQL 🎯
Template based scanning for GraphQL endpoints for further exploitation.
- Detecting GraphQL endpoints for multiple domains.

<br/><br/>
You may integrate the ["get-graphql.yaml"](https://github.com/utkarsh24122/get-GraphQL/blob/main/get-graphql.yaml) template in your own workflow.

If you don't have one, feel free to checkout my workflow automation: [Vulnhunt](https://github.com/utkarsh24122/VulnHunt)

# Setup 🛠
```
git clone https://github.com/utkarsh24122/get-GraphQL
cd get-GraphQL
chmod +x get-graphql.sh
```
Make sure you have installed [nuclei](https://github.com/projectdiscovery/nuclei) ---> [Learn How](https://github.com/projectdiscovery/nuclei#install-nuclei)

Install [httpx](https://github.com/projectdiscovery/httpx)

# Usage ⚙
```
make target file :
cat > target.txt
subdomain.target.com
test.target.com
^C
```
- Run:
 ``` ./get-graphql.sh target.txt ```

template cc : github.com/panch0r3d
