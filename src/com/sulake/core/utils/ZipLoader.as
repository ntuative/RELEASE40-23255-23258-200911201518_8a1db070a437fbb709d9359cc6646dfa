package com.sulake.core.utils
{
   import deng.fzip.FZip;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   import flash.utils.getQualifiedClassName;
   
   public class ZipLoader extends LibraryLoader
   {
       
      
      private var var_559:FZip;
      
      private var var_1233:Array;
      
      private var var_2041:uint = 0;
      
      private var var_814:int = 0;
      
      private var var_2243:Array;
      
      public function ZipLoader(param1:Boolean)
      {
         super(param1);
         var_1233 = new Array();
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         Logger.log(param1.text);
         dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,0));
      }
      
      public function get resources() : Array
      {
         return var_1233;
      }
      
      private function onLoaderComplete(param1:Event) : void
      {
         var _loc2_:LoaderInfo = param1.target as LoaderInfo;
         var _loc3_:String = getQualifiedClassName(var_1.content);
         var_1233.push(var_1.contentLoaderInfo.applicationDomain.getDefinition(_loc3_));
         ++var_814;
         if(var_1233.length == var_2041)
         {
            var_1.contentLoaderInfo.removeEventListener(Event.COMPLETE,onLoaderComplete);
            var_1.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,onIOError);
            dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,0));
         }
         else
         {
            var_1.loadBytes(var_559.getFileAt(var_814).content);
         }
      }
      
      override public function load(param1:URLRequest, param2:LoaderContext = null, param3:int = 1) : void
      {
         var_350 = param1;
         var_559 = new FZip();
         var_559.addEventListener(Event.COMPLETE,onComplete);
         var_559.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
         var_559.addEventListener(ProgressEvent.PROGRESS,onProgress);
         var_559.load(var_350);
      }
      
      private function onProgress(param1:ProgressEvent) : void
      {
         dispatchEvent(param1.clone());
      }
      
      private function onComplete(param1:Event) : void
      {
         var_814 = 0;
         var_2041 = var_559.getFileCount();
         removeEventListeners();
         var_1.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoaderComplete);
         var_1.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
         var_1.loadBytes(var_559.getFileAt(var_814).content);
      }
   }
}
