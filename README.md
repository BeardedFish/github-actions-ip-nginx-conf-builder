# GitHub Actions IP NGINX Conf Builder

A PowerShell script which generates a list of [NGINX](https://www.nginx.com/) `allow` rules of GitHub Actions runner IP addresses based on [GitHub's public API](https://api.github.com/meta).

## Usage

```
./GenerateGitHubActionsNginxConf.ps1 > ./github-actions-ip-addresses.conf
```

Once your configuration file is generated, you can then include it in your NGINX server's configuration.

The below example assumes that the generated `github-actions-ip-addresses.conf` config file is located under the `/etc/nginx/conf` directory:

```nginx
server {
	root /var/www/example-darianbenam-dot-com;
	include conf/github-actions-ip-addresses.conf;
	deny all;

	# ...
}
```
