<template>
    <div>
        <div class="position-relative">
            <section class="section-shaped my-0 ">
                <div class="shape shape-style-1 shape-default shape-skew">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
                <div class="container shape-container d-flex">
                    <div class="col px-0">
                        <div class="row justify-content-center">
                            <div class="col-lg-12">
                                <card gradient="secondary" shadow body-classes="p-lg-5">
                                    <iframe id="map" width="100%" height="500" style="border:0" loading="lazy"
                                        allowfullscreen referrerpolicy="no-referrer-when-downgrade"
                                        :src=embedLink()></iframe>
                                </card>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</template>

<script>

import axios from 'axios';

export default {

    name: "harta",

    data() {
        return {
            masini: [],
            locatie: {}
        };
    },

    components: {},
    mounted() {
        this.saveData()
    },

    methods: {

        embedLink() {
            let API_KEY = "AIzaSyBQNk-eYqbYc204CgxijqX4O5EaESNEabY";
            // let link = "https://www.google.com/maps/embed/v1/place?key=" + API_KEY + "&q=" + "44.433446,26.057620" + "&zoom=16";
            let link = "https://www.google.com/maps/embed/v1/place?key=" + API_KEY + "&q=" + this.locatie["x"] + "," + this.locatie["y"] + "&zoom=16"
            console.log(link);
            return link;
        },

        async saveData() {

            let options = {
                method: 'GET',
                url: 'http://127.0.0.1:8000/masini',
                headers: { accept: 'application/json; charset=utf-8' }
            };

            this.getData(options)
                .then(data => {
                    this.masini = data;
                });

            options = {
                method: 'GET',
                url: 'http://127.0.0.1:8000/locatie',
                headers: { accept: 'application/json; charset=utf-8' }
            };

            this.getData(options)
                .then(data => {
                    this.locatie = data[data.length-1];
                })

        },

        async getData(options) {
            const response = await axios.request(options);
            return response.data;
        }
    }
};

</script>
<style scoped>
.position-relative {
    height: 100vh;
    overflow: scroll;
}


::-webkit-scrollbar {
    width: 0;
    background: transparent;
}

::-webkit-scrollbar-thumb {
    background: lightgreen;
}
</style>
