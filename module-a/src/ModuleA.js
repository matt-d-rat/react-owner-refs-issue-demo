import React, { PureComponent } from 'react';

class ModuleA extends PureComponent {
	render() {
		return (
			<ul>
				<li>This text is output from Module A.</li>
			</ul>
		);
	}
}

export default ModuleA;
export { ModuleA };