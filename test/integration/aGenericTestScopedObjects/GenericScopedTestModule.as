package integration.aGenericTestScopedObjects {
import mvcexpress.extensions.scoped.modules.ModuleScoped;
import mvcexpress.extensions.scoped.mvc.ProxyScoped;
import mvcexpress.mvc.Proxy;

/**
 * COMMENT : todo
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class GenericScopedTestModule extends ModuleScoped {

	public function GenericScopedTestModule(moduleName:String) {
		super(moduleName);
	}

	//----------------------------------
	//     communication
	//----------------------------------

	public function sendMessageTest(type:String, params:Object = null):void {
		super.sendMessage(type, params);
	}

	public function sendScopeMessageTest(scopeName:String, type:String, params:Object = null):void {
		super.sendScopeMessage(scopeName, type, params);
	}

	//----------------------------------
	//     proxymap
	//----------------------------------

	public function proxymap_map(proxyObject:Proxy, injectClass:Class = null, name:String = ""):String {
		return proxyMap.map(proxyObject, injectClass, name);
	}

	public function proxymap_unmap(injectClass:Class, name:String = ""):String {
		return proxyMap.unmap(injectClass, name);
	}

	public function proxymap_scopeMap(scopeName:String, proxyObject:ProxyScoped, injectClass:Class = null, name:String = ""):void {
		proxyMapScoped.scopeMap(scopeName, proxyObject, injectClass, name);
	}

	public function proxymap_scopeUnmap(scopeName:String, injectClass:Class, name:String = ""):void {
		proxyMapScoped.scopeUnmap(scopeName, injectClass, name);
	}

	public function proxymap_getProxy(injectClass:Class, name:String = ""):Proxy {
		return proxyMap.getProxy(injectClass, name);
	}

	public function proxymap_isMapped(proxyObject:Proxy, injectClass:Class = null, name:String = ""):Boolean {
		return proxyMap.isMapped(injectClass, name, proxyObject);
	}

	public function proxymap_lazyMap(proxyClass:Class, injectClass:Class = null, name:String = "", proxyParams:Array = null):String {
		return proxyMap.lazyMap(proxyClass, injectClass, name, proxyParams);
	}

	//----------------------------------
	//     mediator map
	//----------------------------------

	public function mediatorMap_map(viewClass:Class, mediatorClass:Class, injectClass:Class = null):void {
		mediatorMap.map(viewClass, mediatorClass, injectClass);
	}

	public function mediatorMap_unmap(viewClass:Class):void {
		mediatorMap.unmap(viewClass);
	}

	public function mediatorMap_mediate(viewObject:Object):void {
		mediatorMap.mediate(viewObject);
	}

	public function mediatorMap_mediateWith(viewObject:Object, mediatorClass:Class, injectClass:Class = null):void {
		mediatorMap.mediateWith(viewObject, mediatorClass, injectClass);
	}

	public function mediatorMap_unmediate(viewObject:Object):void {
		mediatorMap.unmediate(viewObject);
	}

	public function mediatorMap_isMapped(viewClass:Class, mediatorClass:Class):Boolean {
		return mediatorMap.isMapped(viewClass, mediatorClass);
	}

	public function mediatorMap_isMediated(viewObject:Object):Boolean {
		return mediatorMap.isMediated(viewObject);
	}

	//----------------------------------
	//     commandmap
	//----------------------------------

	public function commandMap_execute(commandClass:Class, params:Object = null):void {
		commandMap.execute(commandClass, params);
	}

	public function commandMap_map(type:String, commandClass:Class):void {
		commandMap.map(type, commandClass);
	}

	public function commandMap_unmap(type:String, commandClass:Class):void {
		commandMap.unmap(type);
	}

	public function commandMap_scopeMap(scopeName:String, type:String, commandClass:Class):void {
		commandMapScoped.scopeMap(scopeName, type, commandClass);
	}

	public function commandMap_scopeUnmap(scopeName:String, type:String, commandClass:Class):void {
		commandMapScoped.scopeUnmap(scopeName, type);
	}

	public function commandMap_isMapped(type:String, commandClass:Class):Boolean {
		return commandMap.isMapped(type, commandClass);
	}

	public function commandMap_clearCommandPool(commandClass:Class):void {
		commandMap.clearCommandPool(commandClass);
	}

	public function commandMap_checkIsClassPooled(commandClass:Class):Boolean {
		return commandMap.isCommandPooled(commandClass);
	}

	//----------------------------------
	//     Scope
	//----------------------------------

	public function registerScopeTest(scopeName:String, messageSending:Boolean = true, messageReceiving:Boolean = true, proxieMap:Boolean = false):void {
		super.registerScope(scopeName, messageSending, messageReceiving, proxieMap);
	}

	public function unregisterScopeTest(scopeName:String):void {
		super.unregisterScope(scopeName);
	}

}
}