preparation
prepareBootstrap
	
	self
		exportKernelProtocols;
		exportKernelPackageNames;
		exportAllPackagesIntoMcz;
		exportMonticelloInStFile;
		exportFileSystemInStFile;
		exportDeprecatedInStFile.