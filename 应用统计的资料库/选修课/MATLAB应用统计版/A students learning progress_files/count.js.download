var wordStatistics = {
	// 国际化
	getI18nContent: function (content) {
		if (!content) {
			return '';
		}
		var i18nCountData = {
			'zh': {
				"count": "文字统计",
				"totalCount": "总字数",
				"chNums": "中文字数",
				"enNums": "英文单词数",
			},
			'en': {
				"count": "word statistics",
				"totalCount": "total words",
				"chNums": "chinese words",
				"enNums": "english words",
			},
			'zh_tw': {
				"count": "文字統計",
				"totalCount": "總字數",
				"chNums": "中文字數",
				"enNums": "英文單詞數",
			}
		};
		// 获取设置的语言
		var language = (wordStatistics.getCookie('browserLocale') || navigator.language || 'zh').toLocaleLowerCase() // 这是获取浏览器的语言
		if (language.indexOf('en') > -1) {
			language = 'en'
		} else if (language.indexOf('zh_tw') > -1 || language.indexOf('zh-tw') > -1) {
			language = 'zh_tw'
		} else {
			language = 'zh'
		}
		content = i18nCountData[language][content]
		return content;
	},
	getCookie: function(name){
		var arr,reg=new RegExp("(^| )*"+name+"=([^;]*)(;|$)");
		if(arr = document.cookie.match(reg)){
			return unescape(arr[2]);
		}else{
			return '';
		}
	},
	count: function (content, top, left, prefix) {
		var wrap = document.querySelector('.word-statistics-wrap')
		if (!wrap) {
			var div = document.createElement('div');
			div.className = 'word-statistics-wrap';
			div.innerHTML = '<div class="word-statistics-head">' +
				'<div>'+ wordStatistics.getI18nContent('count') +'</div>' +
				'<img src="' + prefix + 'themes/default/images/closeWordSta.png" class="word-statistics-close">' +
				'</div>' +
				'<div class="word-statistics-content">' +
				'<p>'+ wordStatistics.getI18nContent('totalCount') +':<span id="totalChars">0</span></p>' +
				'<p>'+ wordStatistics.getI18nContent('chNums') +':<span id="chNums">0</span></p>' +
				'<p>'+ wordStatistics.getI18nContent('enNums') +':<span id="enNums">0</span></p>' +
				'</div>';
			document.body.appendChild(div);
			div.querySelector('.word-statistics-close').onclick = function () {
				div.style.display = 'none';
			}
			div.onclick = function (e) {
				e.stopPropagation();
			}
			wrap = div
		}
		wrap.style.top = top + 'px';
		wrap.style.left = left + 'px';
		wrap.style.display = 'block';
		wrap.querySelector('#totalChars').innerText = this.countTotalWords(content);
		wrap.querySelector('#enNums').innerText = this.countEnglishWords(content);
		wrap.querySelector('#chNums').innerText = this.countChineseWords(content);
	},
	close: function (){
		var wrap = document.querySelector('.word-statistics-wrap')
		if(wrap){
			wrap.style.display = 'none';
		}
	},
	countTotalWords(text) {
		// 使用正则表达式将文本分割成字符数组
		// 这个正则表达式会匹配所有的字符
		var chars = text.trim().match(/[\u0000-\uFFFF]/g);
		// 如果没有匹配到任何字符,返回0
		if (!chars) {
			return 0;
		}
		// 返回字符数组的长度,即总字数
		return chars.length;
	},
	// 统计单词数量
	countEnglishWords: function (text) {
		// 使用正则表达式将文本分割成单词数组
		// 这个正则表达式会匹配空格、标点符号、换行符等,并将它们作为分隔符
		var words = text.match(/\b\w+\b/g);
		// 如果没有匹配到任何单词,返回0
		if (!words) {
			return 0;
		}
		return words.length;
	},
	// 统计中文单词数量
	countChineseWords: function (text) {
		// 使用正则表达式将文本分割成汉字数组
		// 这个正则表达式会匹配所有的汉字
		var chineseWords = text.match(/[\u4e00-\u9fa5]/g);
		// 如果没有匹配到任何汉字,返回0
		if (!chineseWords) {
			return 0;
		}
		return chineseWords.length;
	},
}
