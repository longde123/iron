package lue.resource;

import lue.resource.importer.SceneFormat;

class Resource {

	static var cachedScenes:Map<String, TSceneFormat> = new Map();
	static var cachedModels:Map<String, ModelResource> = new Map();
	static var cachedLights:Map<String, LightResource> = new Map();
	static var cachedCameras:Map<String, CameraResource> = new Map();
	static var cachedMaterials:Map<String, MaterialResource> = new Map();
	static var cachedShaders:Map<String, ShaderResource> = new Map();

	public function new() {

	}

	public static function getModel(name:String, id:String):ModelResource {
		var cached = cachedModels.get(name + id);
		if (cached == null) {
			var parsed = ModelResource.parse(name, id);
			cachedModels.set(name + id, parsed);
			return parsed;
		}
		else return cached;
	}

	public static function getLight(name:String, id:String):LightResource {
		var cached = cachedLights.get(name + id);
		if (cached == null) {
			var parsed = LightResource.parse(name, id);
			cachedLights.set(name + id, parsed);
			return parsed;
		}
		else return cached;
	}

	public static function getCamera(name:String, id:String):CameraResource {
		var cached = cachedCameras.get(name + id);
		if (cached == null) {
			var parsed = CameraResource.parse(name, id);
			cachedCameras.set(name + id, parsed);
			return parsed;
		}
		else return cached;
	}

	public static function getMaterial(name:String, id:String):MaterialResource {
		var cached = cachedMaterials.get(name + id);
		if (cached == null) {
			var parsed = MaterialResource.parse(name, id);
			cachedMaterials.set(name + id, parsed);
			return parsed;
		}
		else return cached;
	}

	public static function getShader(name:String, id:String):ShaderResource {
		var cached = cachedShaders.get(id); // Shader must have unique id
		if (cached == null) {
			var parsed = ShaderResource.parse(name, id);
			cachedShaders.set(id, parsed);
			return parsed;
		}
		else return cached;
	}

	public static function getSceneResource(name:String):TSceneFormat {
		var cached = cachedScenes.get(name);
		if (cached == null) {
			var data = kha.Loader.the.getBlob(name).toString();
			var parsed:TSceneFormat = haxe.Json.parse(data);
			cachedScenes.set(name, parsed);

			return parsed;
		}
		else {
			return cached;
		}	
	}

	public static function getGeometryResourceById(resources:Array<TGeometryResource>, id:String):TGeometryResource {
		if (id == "") return resources[0];
		for (res in resources) {
			if (res.id == id) return res;
		}
		return null;
	}

	public static function getLightResourceById(resources:Array<TLightResource>, id:String):TLightResource {
		if (id == "") return resources[0];
		for (res in resources) {
			if (res.id == id) return res;
		}
		return null;
	}

	public static function getCameraResourceById(resources:Array<TCameraResource>, id:String):TCameraResource {
		if (id == "") return resources[0];
		for (res in resources) {
			if (res.id == id) return res;
		}
		return null;
	}

	public static function getPipelineResourceById(resources:Array<TPipelineResource>, id:String):TPipelineResource {
		if (id == "") return resources[0];
		for (res in resources) {
			if (res.id == id) return res;
		}
		return null;
	}

	public static function getMaterialResourceById(resources:Array<TMaterialResource>, id:String):TMaterialResource {
		if (id == "") return resources[0];
		for (res in resources) {
			if (res.id == id) return res;
		}
		return null;
	}

	public static function getShaderResourceById(resources:Array<TShaderResource>, id:String):TShaderResource {
		if (id == "") return resources[0];
		for (res in resources) {
			if (res.id == id) return res;
		}
		return null;
	}
}