var nMaxTotalImageSize = 5*1024*1024; // 5M
var nTotalSize = 0;
var fileCount = 0;
function fnImgClick() {
	 
 	var d = new Date();
 	var imageid = d.getFullYear()+""+(d.getMonth() + 1)+""+d.getDate()+""+d.getHours()+""+d.getMinutes()+""+d.getSeconds();
 	var imgname = "img-uploader"+imageid+"";
 	
 	var imgcnt = $('.imgUplader').index() + 1;

 	$("#imgUpload").append('<input type="file" accept="image/*" id="'+imgname+'"  style="display:none"  onchange="fnImgUpload(\''+imgname+'\')" class="imgUplader">');
 	
 	$('.imgUplader').last().attr("name",imgname);
 	
 	$('.imgUplader').last().trigger('click');	
}
	
 
 function fnImgUpload(imgname) {
		//버블링 체크 
		//if ( !event.isDefaultPrevented() ) { 
			
		var input, file, fr, img;
     	
		if (typeof window.FileReader !== 'function') {
    		write("The file API isn't supported on this browser yet.");
    		return;
		}
		var txObj = document.getElementsByName(imgname);
		input = txObj[txObj.length - 1];
		
		//alert(input.value);
		if (!input) {
    		//write("Um, couldn't find the imgfile element.");
    		alert("Um, couldn't find the imgfile element.");
		}
		else if (!input.files) {
			alert("This browser doesn't seem to support the `files` property of file inputs.");
    		//write("This browser doesn't seem to support the `files` property of file inputs.");
		}
		else if (!input.files[0]) {
    		//write("Please select a file before clicking 'Load'");
    		alert("Please select a file before clicking 'Load'");
		}
		else {			
			fileCount = $("#editorId").contents().find("#se2_iframe").contents().find(".se2_inputarea").find("img").length;
			
			
    		file = input.files[0];
    		
    		var ofile = file,
			sFileSize = 0,
			sFileName = "",
			bExceedLimitTotalSize = false
			
			sFileSize = setUnitString(ofile.size);
			sFileName = cuttingNameByLength(ofile.name, 15);
			//bExceedLimitTotalSize = checkTotalImageSize(ofile.size);
			fileCount++;	

			if( ofile.size > nMaxTotalImageSize ){
				alert("이미지 용량이 5MB를 초과하여 등록할 수 없습니다. \n\n (파일명 : "+sFileName+", 사이즈 : "+sFileSize+")");
				$('#'+imgname).remove();
				fileCount--;				
			} else {
				if(fileCount > 5 ){
					alert("이미지는 5개까지 등록 가능합니다.");
					$('#'+imgname).remove();
					fileCount--;
				}else{
					fr = new FileReader();
		    		fr.onload = createImage;
		    		var objectURL = URL.createObjectURL(file);

		    		var sHTML = '<img id="'+imgname+'" src="'+objectURL+'"/>';
					oEditors.getById["textAreaContent"].exec("PASTE_HTML", [sHTML]);
					
					
				}
			}
			
			
			
//			var imgTagCnt = $("#se2_iframe").contents().find('.se2_inputarea').children();
//		 	alert(imgTagCnt.length);
//		 	
//		 	alert($("#se2_iframe").attr('width'));
		 	
		}

        function createImage() {
            img = new Image();
		    img.src = fr.result;
		    src = img.src;
     	}
	}
 
 /**
	 * 화면 목록에 적당하게 이름을 잘라서 표시.
	 * @param {Object} sName 파일명
	 * @param {Object} nMaxLng 최대 길이
	 */
	function cuttingNameByLength (sName, nMaxLng) {
		var sTemp, nIndex;
		if(sName.length > nMaxLng){
			nIndex = sName.indexOf(".");
			sTemp = sName.substring(0,nMaxLng) + "..." + sName.substring(nIndex,sName.length) ;
		} else {
			sTemp = sName;
		}
		return sTemp;
	}
	
	/**
 	 * byte로 받은 이미지 용량을 화면에 표시를 위해 포맷팅
 	 * @param {Object} nByte
 	 */
 	function setUnitString (nByte) {
 		var nImageSize;
 		var sUnit;
 		
 		if(nByte < 0 ){
 			nByte = 0;
 		}
 		
 		if( nByte < 1024) {
 			nImageSize = Number(nByte);
 			sUnit = 'B';
 			return nImageSize + sUnit;
 		} else if( nByte > (1024*1024)) {
 			nImageSize = Number(parseInt((nByte || 0), 10) / (1024*1024));
 			sUnit = 'MB';
 			return nImageSize.toFixed(2) + sUnit;
 		} else {
 			nImageSize = Number(parseInt((nByte || 0), 10) / 1024);
 			sUnit = 'KB';
 			return nImageSize.toFixed(0) + sUnit;
 		}
     }
 	
 	/**
 	 * Total Image Size를 체크해서 추가로 이미지를 넣을지 말지를 결정함.
 	 * @param {Object} nByte
 	 */
 	function checkTotalImageSize(nByte){
 		if( nTotalSize + nByte < nMaxTotalImageSize){
 			nTotalSize = nTotalSize + nByte;
 			return false;
 		} else {
 			return true;
 		}
 	}