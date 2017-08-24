import React, { PureComponent } from 'react';

import { ModuleA } from 'npm-peer-test-module-a';
import { ModuleB } from 'npm-peer-test-module-b';
import { ModuleC } from 'npm-peer-test-module-c';

class App extends PureComponent {
	render() {
		return (
			<ul>
				<li>This text is output from app.</li>
				<ModuleA />
				<ModuleB />
				<ModuleC />
			</ul>
		);
	}
}

export default App;
export { App };