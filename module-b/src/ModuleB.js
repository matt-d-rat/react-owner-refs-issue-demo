import React, { PureComponent } from 'react';

class ModuleB extends PureComponent {
	render() {
		return (
			<ul ref="moduleB">
				<li>This text is output from Module B.</li>
			</ul>
		);
	}
}

export default ModuleB;
export { ModuleB };