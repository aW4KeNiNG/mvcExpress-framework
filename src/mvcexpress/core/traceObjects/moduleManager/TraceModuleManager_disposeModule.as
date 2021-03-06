// Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php
package mvcexpress.core.traceObjects.moduleManager {
import mvcexpress.core.traceObjects.MvcTraceActions;
import mvcexpress.core.traceObjects.TraceObj;

/**
 * Class for mvcExpress tracing. (debug mode only)
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 * @private
 *
 * @version 2.0.rc1
 */
public class TraceModuleManager_disposeModule extends TraceObj {

	public function TraceModuleManager_disposeModule(moduleName:String) {
		super(MvcTraceActions.MODULEMANAGER_DISPOSEMODULE, moduleName);
	}

	override public function toString():String {
		return "#####- " + MvcTraceActions.MODULEMANAGER_DISPOSEMODULE + " > moduleName : " + moduleName;
	}

}
}