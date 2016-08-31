{
	network.description = "test server";

	test =
	{ config, pkgs, ... }:
	{ 
        environment.systemPackages = [ pkgs.git pkgs.vim ];
	};
}
