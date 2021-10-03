package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.IPlaneRasterizer;
   import com.sulake.habbo.room.object.visualization.room.utils.PlaneBitmapData;
   import com.sulake.habbo.room.object.visualization.room.utils.Randomizer;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.display.BitmapDataChannel;
   import flash.display.BlendMode;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomPlane
   {
      
      public static const const_171:int = 2;
      
      public static const const_1458:int = 0;
      
      public static const const_172:int = 3;
      
      public static const const_218:int = 1;
       
      
      private var var_370:Vector3d = null;
      
      private var var_616:Array;
      
      private var var_244:Vector3d = null;
      
      private var var_167:Map = null;
      
      private var _bitmapData:BitmapData = null;
      
      private var _type:int = 0;
      
      private var var_618:IPlaneRasterizer = null;
      
      private var var_617:Vector3d = null;
      
      private var _height:Number = 0;
      
      private var var_126:Vector3d = null;
      
      private var var_105:Vector3d = null;
      
      private var var_80:Vector3d = null;
      
      private var var_104:Vector3d = null;
      
      private var var_1676:Number = 0;
      
      private var var_189:Array;
      
      private var var_243:Vector3d = null;
      
      private var var_500:PlaneMaskManager = null;
      
      private var _isVisible:Boolean = true;
      
      private var _color:uint = 0;
      
      private var var_1794:Number = 0;
      
      private var var_1792:Number = 0;
      
      private var var_1793:int = 0;
      
      private var var_151:Boolean = false;
      
      private var var_76:Vector3d = null;
      
      private var var_61:BitmapData = null;
      
      private var var_1791:Number = 0;
      
      private var var_1795:Number = 0;
      
      private var _offset:Point = null;
      
      private var var_1114:Array;
      
      private var var_1088:int = -1;
      
      private var var_918:Array;
      
      private var var_1364:Boolean = true;
      
      private var _id:String = null;
      
      private var _width:Number = 0;
      
      private var var_171:BitmapData = null;
      
      private var var_750:Boolean = false;
      
      private var var_901:Number = 0;
      
      private var var_1675:Number = 0;
      
      private var var_1678:Number = 0;
      
      private var var_248:Array;
      
      private var var_1677:Number = 0;
      
      public function RoomPlane(param1:IVector3d, param2:IVector3d, param3:IVector3d, param4:IVector3d, param5:int, param6:Boolean, param7:Array, param8:int, param9:Number = 0, param10:Number = 0, param11:Number = 0, param12:Number = 0)
      {
         var _loc13_:int = 0;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var_1114 = [];
         var_189 = [];
         var_248 = [];
         var_616 = [];
         var_918 = [];
         super();
         var_1793 = param8;
         var_617 = new Vector3d();
         var_617.assign(param1);
         var_76 = new Vector3d();
         var_76.assign(param2);
         var_243 = new Vector3d();
         var_243.assign(param3);
         var_244 = new Vector3d();
         var_244.assign(param4);
         var_370 = Vector3d.crossProduct(var_243,var_244);
         if(false)
         {
            var_370.mul(Infinity);
         }
         if(param7 != null)
         {
            _loc13_ = 0;
            while(_loc13_ < param7.length)
            {
               _loc14_ = param7[_loc13_] as IVector3d;
               if(_loc14_ != null)
               {
                  _loc15_ = new Vector3d();
                  _loc15_.assign(_loc14_);
                  var_1114.push(_loc14_);
               }
               _loc13_++;
            }
         }
         _offset = new Point();
         _type = param5;
         var_167 = new Map();
         var_126 = new Vector3d();
         var_105 = new Vector3d();
         var_80 = new Vector3d();
         var_104 = new Vector3d();
         var_1791 = param9;
         var_1795 = param10;
         var_1794 = param11;
         var_1792 = param12;
         var_750 = param6;
      }
      
      public function resetRectangleMasks() : void
      {
         if(var_750)
         {
            if(false)
            {
               return;
            }
            var_151 = true;
            var_248 = [];
         }
      }
      
      private function resetTextureCache(param1:BitmapData = null) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         if(var_167 != null)
         {
            _loc2_ = 0;
            while(_loc2_ < var_167.length)
            {
               _loc3_ = var_167.getWithIndex(_loc2_) as PlaneBitmapData;
               if(_loc3_ != null)
               {
                  if(_loc3_.bitmap != null && _loc3_.bitmap != param1)
                  {
                     _loc3_.bitmap.dispose();
                  }
                  _loc3_.dispose();
               }
               _loc2_++;
            }
            var_167.reset();
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(_bitmapData != null)
         {
            _bitmapData.dispose();
            _bitmapData = null;
         }
         if(var_167 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < var_167.length)
            {
               _loc2_ = var_167.getWithIndex(_loc1_) as PlaneBitmapData;
               if(_loc2_ != null)
               {
                  if(_loc2_.bitmap != null)
                  {
                     _loc2_.bitmap.dispose();
                  }
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            var_167.dispose();
            var_167 = null;
         }
         var_76 = null;
         var_617 = null;
         var_243 = null;
         var_244 = null;
         var_370 = null;
         var_618 = null;
         var_126 = null;
         var_105 = null;
         var_80 = null;
         var_104 = null;
         var_189 = null;
         var_248 = null;
         if(var_61 != null)
         {
            var_61.dispose();
            var_61 = null;
         }
         if(var_171 != null)
         {
            var_171.dispose();
            var_171 = null;
         }
      }
      
      public function get hasTexture() : Boolean
      {
         return var_1364;
      }
      
      public function set rasterizer(param1:IPlaneRasterizer) : void
      {
         var_618 = param1;
      }
      
      private function cacheTexture(param1:String, param2:PlaneBitmapData) : Boolean
      {
         var _loc3_:PlaneBitmapData = var_167.remove(param1) as PlaneBitmapData;
         if(_loc3_ != null)
         {
            if(param2 != null && param2.bitmap != _loc3_.bitmap)
            {
               _loc3_.bitmap.dispose();
            }
            _loc3_.dispose();
         }
         var_167.add(param1,param2);
         return true;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function addBitmapMask(param1:String, param2:Number, param3:Number) : Boolean
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         if(var_750)
         {
            _loc4_ = null;
            _loc5_ = 0;
            while(_loc5_ < var_189.length)
            {
               _loc4_ = var_189[_loc5_] as RoomPlaneBitmapMask;
               if(_loc4_ != null)
               {
                  if(_loc4_.type == param1 && _loc4_.leftSideLoc == param2 && _loc4_.rightSideLoc == param3)
                  {
                     return false;
                  }
               }
               _loc5_++;
            }
            _loc4_ = new RoomPlaneBitmapMask(param1,param2,param3);
            var_189.push(_loc4_);
            var_151 = true;
            return true;
         }
         return false;
      }
      
      public function set id(param1:String) : void
      {
         if(param1 != _id)
         {
            resetTextureCache();
            _id = param1;
         }
      }
      
      public function set hasTexture(param1:Boolean) : void
      {
         var_1364 = param1;
      }
      
      private function draw(param1:BitmapData, param2:Matrix) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = NaN;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(_bitmapData != null)
         {
            if(param2.a == 1 && param2.d == 1 && param2.c == 0 && param2.b != 0 && Math.abs(param2.b) <= 1 && (_type == const_218 || _type == const_172))
            {
               _loc3_ = 0;
               _loc4_ = 0;
               _loc5_ = 0;
               _loc6_ = 0;
               if(param2.b > 0)
               {
                  ++param2.ty;
               }
               _loc7_ = 0;
               while(_loc3_ < param1.width)
               {
                  _loc3_++;
                  _loc5_ += Math.abs(param2.b);
                  if(_loc5_ >= 1)
                  {
                     _bitmapData.copyPixels(param1,new Rectangle(_loc4_ + _loc6_,0,_loc3_ - _loc4_,param1.height),new Point(param2.tx + _loc4_,param2.ty + _loc7_),null,null,true);
                     _loc4_ = _loc3_;
                     if(param2.b > 0)
                     {
                        _loc7_++;
                     }
                     else
                     {
                        _loc7_--;
                     }
                     _loc5_ = 0;
                  }
               }
               if(_loc5_ > 0)
               {
                  _bitmapData.copyPixels(param1,new Rectangle(_loc4_,0,_loc3_ - _loc4_,param1.height),new Point(param2.tx + _loc4_,param2.ty + _loc7_),null,null,true);
               }
               return;
            }
            _bitmapData.draw(param1,param2,null,null,null,false);
         }
      }
      
      public function set maskManager(param1:PlaneMaskManager) : void
      {
         var_500 = param1;
      }
      
      private function updateMask(param1:BitmapData, param2:IRoomGeometry) : void
      {
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:* = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         if(!var_750 || false && false && !var_151 || var_500 == null)
         {
            return;
         }
         if(param1 == null || param2 == null)
         {
            return;
         }
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         updateMaskChangeStatus();
         var _loc7_:Number = param1.width;
         var _loc8_:Number = param1.height;
         if(var_61 == null || var_61.width != _loc7_ || var_61.height != _loc8_)
         {
            if(var_61 != null)
            {
               var_61.dispose();
               var_61 = null;
            }
            var_61 = new BitmapData(_loc7_,_loc8_,true,16777215);
            var_151 = true;
         }
         if(var_151)
         {
            var_616 = [];
            var_918 = [];
            if(var_61 != null)
            {
               var_61.fillRect(var_61.rect,16777215);
            }
            resetTextureCache(param1);
            _loc9_ = param2.getCoordinatePosition(var_370);
            _loc10_ = 0;
            _loc11_ = 0;
            _loc5_ = 0;
            while(_loc5_ < var_189.length)
            {
               _loc3_ = var_189[_loc5_] as RoomPlaneBitmapMask;
               if(_loc3_ != null)
               {
                  _loc10_ = 0 - 0 * _loc3_.leftSideLoc / 0;
                  _loc11_ = 0 - 0 * _loc3_.rightSideLoc / 0;
                  _loc12_ = _loc3_.type;
                  var_500.updateMask(var_61,_loc12_,param2.scale,_loc9_,_loc10_,_loc11_);
                  var_616.push(new RoomPlaneBitmapMask(_loc12_,_loc3_.leftSideLoc,_loc3_.rightSideLoc));
               }
               _loc5_++;
            }
            _loc6_ = 0;
            while(_loc6_ < var_248.length)
            {
               _loc4_ = var_248[_loc6_] as RoomPlaneRectangleMask;
               if(_loc4_ != null)
               {
                  _loc10_ = 0 - 0 * _loc4_.leftSideLoc / 0;
                  _loc11_ = 0 - 0 * _loc4_.rightSideLoc / 0;
                  _loc13_ = 0 * _loc4_.leftSideLength / 0;
                  _loc14_ = 0 * _loc4_.rightSideLength / 0;
                  var_61.fillRect(new Rectangle(_loc10_ - _loc13_,_loc11_ - _loc14_,_loc13_,_loc14_),4278190080);
                  var_918.push(new RoomPlaneRectangleMask(_loc4_.leftSideLength,_loc4_.rightSideLoc,_loc4_.leftSideLength,_loc4_.rightSideLength));
               }
               _loc6_++;
            }
            var_151 = false;
         }
         combineTextureMask(param1,var_61);
      }
      
      public function get relativeDepth() : Number
      {
         return var_1676;
      }
      
      public function resetBitmapMasks() : void
      {
         if(var_750)
         {
            if(false)
            {
               return;
            }
            var_151 = true;
            var_189 = [];
         }
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get visible() : Boolean
      {
         return _isVisible;
      }
      
      private function getTextureIdentifier(param1:IRoomGeometry) : String
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:String = String(param1.scale);
         if(var_618 != null)
         {
            _loc2_ = var_618.getTextureIdentifier(param1.scale,normal);
         }
         return _loc2_;
      }
      
      public function get bitmapData() : BitmapData
      {
         if(_isVisible)
         {
            if(_bitmapData != null)
            {
               return _bitmapData.clone();
            }
         }
         return null;
      }
      
      public function get offset() : Point
      {
         return _offset;
      }
      
      public function get rightSide() : IVector3d
      {
         return var_244;
      }
      
      private function renderTexture(param1:IRoomGeometry, param2:BitmapData) : void
      {
         if(var_126 == null || var_105 == null || var_80 == null || var_104 == null || param2 == null || _bitmapData == null)
         {
            return;
         }
         var _loc3_:Number = 0 - 0;
         var _loc4_:Number = 0 - 0;
         var _loc5_:Number = 0 - 0;
         var _loc6_:Number = 0 - 0;
         if(_type == const_218 || _type == const_172)
         {
            if(Math.abs(_loc5_ - param2.width) <= 1)
            {
               _loc5_ = param2.width;
            }
            if(Math.abs(_loc6_ - param2.width) <= 1)
            {
               _loc6_ = param2.width;
            }
            if(Math.abs(_loc3_ - param2.height) <= 1)
            {
               _loc3_ = param2.height;
            }
            if(Math.abs(_loc4_ - param2.height) <= 1)
            {
               _loc4_ = param2.height;
            }
         }
         var _loc7_:Number = _loc5_ / param2.width;
         var _loc8_:Number = _loc6_ / param2.width;
         var _loc9_:Number = _loc3_ / param2.height;
         var _loc10_:Number = _loc4_ / param2.height;
         var _loc11_:Matrix = new Matrix();
         _loc11_.a = _loc7_;
         _loc11_.b = _loc8_;
         _loc11_.c = _loc9_;
         _loc11_.d = _loc10_;
         _loc11_.translate(var_80.x,var_80.y);
         draw(param2,_loc11_);
      }
      
      public function get location() : IVector3d
      {
         return var_76;
      }
      
      private function updateMaskChangeStatus() : void
      {
         var _loc6_:Boolean = false;
         var _loc7_:* = null;
         if(!var_151)
         {
            return;
         }
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Boolean = true;
         var _loc4_:* = null;
         if(true)
         {
            while(_loc1_ < var_189.length)
            {
               _loc4_ = var_189[_loc1_] as RoomPlaneBitmapMask;
               if(_loc4_ != null)
               {
                  _loc6_ = false;
                  while(_loc2_ < var_616.length)
                  {
                     _loc7_ = var_616[_loc2_] as RoomPlaneBitmapMask;
                     if(_loc7_ != null)
                     {
                        if(_loc7_.type == _loc4_.type && _loc7_.leftSideLoc == _loc4_.leftSideLoc && _loc7_.rightSideLoc == _loc4_.rightSideLoc)
                        {
                           _loc6_ = true;
                           break;
                        }
                     }
                     _loc2_++;
                  }
                  if(!_loc6_)
                  {
                     _loc3_ = false;
                     break;
                  }
               }
               _loc1_++;
            }
         }
         else
         {
            _loc3_ = false;
         }
         if(false)
         {
            _loc3_ = false;
         }
         if(_loc3_)
         {
            var_151 = false;
         }
      }
      
      public function set color(param1:uint) : void
      {
         _color = param1;
      }
      
      private function updateCorners(param1:IRoomGeometry) : void
      {
         var_126.assign(param1.getScreenPosition(var_76));
         var_105.assign(param1.getScreenPosition(Vector3d.sum(var_76,var_244)));
         var_80.assign(param1.getScreenPosition(Vector3d.sum(Vector3d.sum(var_76,var_243),var_244)));
         var_104.assign(param1.getScreenPosition(Vector3d.sum(var_76,var_243)));
         _offset = param1.getScreenPoint(var_617);
         var_126.x = Math.round(var_126.x);
         var_126.y = Math.round(var_126.y);
         var_105.x = Math.round(var_105.x);
         var_105.y = Math.round(var_105.y);
         var_80.x = Math.round(var_80.x);
         var_80.y = Math.round(var_80.y);
         var_104.x = Math.round(var_104.x);
         var_104.y = Math.round(var_104.y);
         _offset.x = Math.round(_offset.x);
         _offset.y = Math.round(_offset.y);
         var _loc2_:Number = Math.min(var_126.x,var_105.x,var_80.x,var_104.x);
         var _loc3_:Number = Math.max(var_126.x,var_105.x,var_80.x,var_104.x);
         var _loc4_:Number = Math.min(var_126.y,var_105.y,var_80.y,var_104.y);
         var _loc5_:Number = Math.max(var_126.y,var_105.y,var_80.y,var_104.y);
         _loc3_ -= _loc2_;
         _offset.x = 0 - _loc2_;
         var_126.x = 0 - _loc2_;
         var_105.x = 0 - _loc2_;
         var_80.x = 0 - _loc2_;
         var_104.x = 0 - _loc2_;
         _loc5_ -= _loc4_;
         _offset.y = 0 - _loc4_;
         var_126.y = 0 - _loc4_;
         var_105.y = 0 - _loc4_;
         var_80.y = 0 - _loc4_;
         var_104.y = 0 - _loc4_;
         _width = _loc3_;
         _height = _loc5_;
      }
      
      public function update(param1:IRoomGeometry, param2:int) : Boolean
      {
         var _loc4_:* = null;
         var _loc5_:* = NaN;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:* = null;
         if(param1 == null || var_617 == null || var_76 == null || var_243 == null || var_244 == null || var_370 == null)
         {
            return false;
         }
         var _loc3_:Boolean = false;
         if(param1.updateId != var_1088)
         {
            var_1088 = param1.updateId;
            _loc4_ = param1.direction;
            if(_loc4_ != null && (_loc4_.x != var_901 || _loc4_.y != var_1675 || _loc4_.z != var_1678 || param1.scale != var_1677))
            {
               var_901 = _loc4_.x;
               var_1675 = _loc4_.y;
               var_1678 = _loc4_.z;
               var_1677 = param1.scale;
               _loc3_ = true;
               _loc5_ = 0;
               _loc5_ = Number(Vector3d.cosAngle(param1.directionAxis,normal));
               if(_loc5_ > -0.001)
               {
                  if(_isVisible)
                  {
                     _isVisible = false;
                     return true;
                  }
                  return false;
               }
               _loc6_ = 0;
               while(_loc6_ < var_1114.length)
               {
                  _loc5_ = Number(Vector3d.cosAngle(param1.directionAxis,var_1114[_loc6_]));
                  if(_loc5_ > -0.001)
                  {
                     if(_isVisible)
                     {
                        _isVisible = false;
                        return true;
                     }
                     return false;
                  }
                  _loc6_++;
               }
               updateCorners(param1);
               _loc7_ = param1.getScreenPosition(var_617);
               _loc8_ = _loc7_.z;
               _loc9_ = Math.max(0 - _loc8_,0 - _loc8_,0 - _loc8_,0 - _loc8_);
               if(_type == const_172)
               {
                  _loc9_ += 0.02;
               }
               var_1676 = _loc9_;
               _isVisible = true;
            }
         }
         if(needsNewTexture(param1,param2) || _loc3_)
         {
            if(_bitmapData == null || _width != _bitmapData.width || _height != _bitmapData.height)
            {
               if(_bitmapData != null)
               {
                  _bitmapData.dispose();
                  _bitmapData = null;
                  if(_width < 1 || _height < 1)
                  {
                     return true;
                  }
               }
               else if(_width < 1 || _height < 1)
               {
                  return false;
               }
               _bitmapData = new BitmapData(_width,_height,true,16777215);
               _bitmapData.lock();
            }
            else
            {
               _bitmapData.lock();
               _bitmapData.fillRect(_bitmapData.rect,16777215);
            }
            Randomizer.setSeed(var_1793);
            _loc10_ = getTexture(param1,param2);
            if(_loc10_ != null)
            {
               renderTexture(param1,_loc10_);
            }
            _bitmapData.unlock();
            return true;
         }
         return false;
      }
      
      private function needsNewTexture(param1:IRoomGeometry, param2:int) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var _loc3_:String = getTextureIdentifier(param1);
         var _loc4_:PlaneBitmapData = var_167.getValue(_loc3_) as PlaneBitmapData;
         if(_width > 0 && _height > 0)
         {
            updateMaskChangeStatus();
            if(_loc4_ == null || _loc4_.timeStamp >= 0 && param2 > _loc4_.timeStamp || var_151)
            {
               return true;
            }
         }
         return false;
      }
      
      public function addRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number) : Boolean
      {
         var _loc5_:* = null;
         var _loc6_:int = 0;
         if(var_750)
         {
            _loc5_ = null;
            _loc6_ = 0;
            while(_loc6_ < var_248.length)
            {
               _loc5_ = var_248[_loc6_] as RoomPlaneRectangleMask;
               if(_loc5_ != null)
               {
                  if(_loc5_.leftSideLoc == param1 && _loc5_.rightSideLoc == param2 && _loc5_.leftSideLength == param3 && _loc5_.rightSideLength == param4)
                  {
                     return false;
                  }
               }
               _loc6_++;
            }
            _loc5_ = new RoomPlaneRectangleMask(param1,param2,param3,param4);
            var_248.push(_loc5_);
            var_151 = true;
            return true;
         }
         return false;
      }
      
      private function getTexture(param1:IRoomGeometry, param2:int) : BitmapData
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         if(param1 == null)
         {
            return null;
         }
         var _loc3_:String = getTextureIdentifier(param1);
         var _loc4_:* = null;
         if(needsNewTexture(param1,param2))
         {
            _loc5_ = 0 * param1.scale;
            _loc6_ = 0 * param1.scale;
            _loc7_ = param1.getCoordinatePosition(var_370);
            _loc4_ = var_167.getValue(_loc3_) as PlaneBitmapData;
            _loc8_ = null;
            if(_loc4_ != null)
            {
               _loc8_ = _loc4_.bitmap;
            }
            if(var_618 != null)
            {
               _loc4_ = var_618.render(_loc8_,_id,_loc5_,_loc6_,param1.scale,_loc7_,var_1364,var_1791,var_1795,var_1794,var_1792,param2);
               if(_loc4_ != null)
               {
                  if(_loc8_ != null && _loc4_.bitmap != _loc8_)
                  {
                     _loc8_.dispose();
                  }
               }
            }
            else
            {
               _loc9_ = new BitmapData(_loc5_,_loc6_,true,4278190080 | _color);
               _loc4_ = new PlaneBitmapData(_loc9_,-1);
            }
            updateMask(_loc4_.bitmap,param1);
            if(_loc4_ != null)
            {
               cacheTexture(_loc3_,_loc4_);
            }
         }
         else
         {
            _loc4_ = var_167.getValue(_loc3_) as PlaneBitmapData;
         }
         if(_loc4_ != null)
         {
            return _loc4_.bitmap;
         }
         return null;
      }
      
      public function get normal() : IVector3d
      {
         return var_370;
      }
      
      private function combineTextureMask(param1:BitmapData, param2:BitmapData) : void
      {
         if(param1 == null || param2 == null)
         {
            return;
         }
         if(var_171 != null && (var_171.width != param1.width || var_171.height != param1.height))
         {
            var_171.dispose();
            var_171 = null;
         }
         if(var_171 == null)
         {
            var_171 = new BitmapData(param1.width,param1.height,true,4294967295);
         }
         var_171.copyChannel(param1,param1.rect,new Point(0,0),BitmapDataChannel.ALPHA,BitmapDataChannel.RED);
         var_171.draw(param2,null,null,BlendMode.DARKEN);
         param1.copyChannel(var_171,var_171.rect,new Point(0,0),BitmapDataChannel.RED,BitmapDataChannel.ALPHA);
      }
      
      public function get leftSide() : IVector3d
      {
         return var_243;
      }
   }
}
