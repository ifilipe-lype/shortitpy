from fastapi import FastAPI

from .routes.short_url_routes import router as short_url_router


app = FastAPI()

app.include_router(short_url_router)

@app.get('/ping')
async def ping_pong():
    return { 'msg': 'pong'}

