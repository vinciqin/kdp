package com.kaltura.commands.annotation
{
	import com.kaltura.vo.KalturaAnnotation;
	import com.kaltura.delegates.annotation.AnnotationUpdateDelegate;
	import com.kaltura.net.KalturaCall;

	public class AnnotationUpdate extends KalturaCall
	{
		public var filterFields : String;
		public function AnnotationUpdate( id : String,annotation : KalturaAnnotation )
		{
			service= 'annotation_annotation';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = kalturaObject2Arrays(annotation,'annotation');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new AnnotationUpdateDelegate( this , config );
		}
	}
}
