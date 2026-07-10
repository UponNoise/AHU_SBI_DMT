var host = window.location.host,
		splitDomainConfig = function(num,domainHost){
			var arr = domainHost.split("."),
				len = arr.length,
				array = [];
			
			if(num>len) return;
			
			for(var i = 0;i < num; i++){
				 array.push(arr[len-(i+1)]);
			 }
			return array.reverse().join('.');
		},
		
		getTopDomain = function(domainHost){
			if(!domainHost) return ;
			var domain = domainHost.substring(domainHost.lastIndexOf(".")+1, domainHost.length);
			if(!domain) return;
			var arr = domainHost.split(".");
			var len = arr.length;
			if (domainHost.indexOf("mooc1.mooc") == 0){
				return splitDomainConfig(len - 1, domainHost);
			} else if(domain == 'cn'&& (len == 4||len==5 || len==6)){
				if(len==5){
					return splitDomainConfig(4,domainHost);
				}else if(domainHost == 'mooc1.sdns.wljy.sdu.edu.cn'){
					return splitDomainConfig(5,domainHost);
				} else if (len == 4 && domainHost.indexOf("zhexuezj") != -1) {
					return splitDomainConfig(2, domainHost);
				}
				return splitDomainConfig(3,domainHost);
			}else if(domainHost == 'mooc1.lxyy.libsou.com'){
				return splitDomainConfig(3,domainHost);
			}else{
				return splitDomainConfig(2,domainHost);
			}
		};
	
	try{
		
		if(window.parent==window){
			document.domain = getTopDomain(host);
		}else if(window.top.document.domain){
			
			//console.log(">>>>>>",window.top.document.domain);
		}
	}catch(e){
		var domain=getTopDomain(host);
		//console.log(">>>>>>",domain);
		document.domain =domain ;
	}