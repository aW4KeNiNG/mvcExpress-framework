// Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php
package mvcexpress.dlc.live.mvc {
import flash.utils.Dictionary;

import mvcexpress.core.namespace.pureLegsCore;
import mvcexpress.dlc.live.core.ProcessMapLive;
import mvcexpress.mvc.Mediator;

use namespace pureLegsCore;

/**
 * Mediates single view object.                                                                                                                            </br>
 *  Main responsibility of mediator is to send message from framework  to view, and receive messages from view and send to framework.                        </br>
 *  Can get proxies injected.                                                                                                                                </br>
 *  Can send messages. (sends messages then user interacts with the view)                                                                                    </br>
 *  Can handle messages. (handles data change or other framework messages)
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
use namespace pureLegsCore;
public class MediatorLive extends Mediator {

	/** Used to provide stuff for processes. */
	pureLegsCore var processMap:ProcessMapLive;

	/**    all objects provided by this mediator storeb by name */
	private var provideRegistry:Dictionary = new Dictionary();
	/* of Object by String*/


	//----------------------------------
	//     mvcExpressLive functions
	//----------------------------------

	/**
	 * Provides any complex object under given name. Provided object can be Injected into Tasks.            <br>
	 * Providing primitive data typse will throw error in debug mode.
	 * @param    object    any complex object
	 * @param    name    name for complex object. (bust be unique, or error will be thrown.)
	 */
	public function provide(object:Object, name:String):void {
		use namespace pureLegsCore;

		processMap.provide(object, name);
		provideRegistry[name] = object;
	}

	/**
	 * Remove pasibility for provided object with given name to be Injected into Tasks.            <br>
	 * If object never been provided with this name - action will fail silently
	 * @param    name    name for provided object.
	 */
	public function unprovide(name:String):void {
		use namespace pureLegsCore;

		processMap.unprovide(name);
		delete provideRegistry[name];
	}

	/**
	 * Remove all from this mediator provided object.
	 */
	public function unprovideAll():void {
		for (var name:String in provideRegistry) {
			unprovide(name);
		}
	}


	/**
	 * framework function to dispose this mediator.                                                                            <br>
	 * Executed automatically AFTER mediator is removed(unmediated). (after mediatorMap.unmediate(...), or module dispose.)                    <br>
	 * It:                                                                                                                        <br>
	 * - remove all handle functions created by this mediator                                                                    <br>
	 * - remove all event listeners created by internal addListener() function                                                    <br>
	 * - sets internals to null                                                                                                    <br>
	 * @private
	 */
	override pureLegsCore function remove():void {
		use namespace pureLegsCore;

		unprovideAll();
		processMap = null;
		provideRegistry = null;
		super.remove();
	}
}
}