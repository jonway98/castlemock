/*
 * Copyright 2015 Karl Dahlgren
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.fortmocks.war.mock.rest.web.mvc.command.resource;

import com.fortmocks.core.mock.rest.model.project.dto.RestResourceDto;

import java.util.List;

/**
 * The DeleteRestResourceCommand is a command class and is used to carry information on
 * which resource should be deleted from the database
 * @author Karl Dahlgren
 * @since 1.0
 */
public class DeleteRestResourceCommand {

    private List<RestResourceDto> restResourceDtos;

    public List<RestResourceDto> getRestResourceDtos() {
        return restResourceDtos;
    }

    public void setRestResourceDtos(List<RestResourceDto> restResourceDtos) {
        this.restResourceDtos = restResourceDtos;
    }
}

