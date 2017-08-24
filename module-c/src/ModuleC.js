import React, { PureComponent } from 'react';
import { ModuleB } from 'npm-peer-test-module-b';

class ModuleC extends PureComponent {
	render() {
		return (
			<ul>
				<li>This text is output from Module C.</li>
				<ModuleB />
			</ul>
		);
	}
}

export default ModuleC;
export { ModuleC };